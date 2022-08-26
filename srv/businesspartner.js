const cds = require('@sap/cds')
const fs = require('fs')
const path = require('path')
const business_partner = require('./BusinessPartner/businessPartner.js')
const balance_sheet = require('./BusinessPartner/balancesheet.js')

function readFile() {
    filePath = path.join(__dirname,"data.json")
    var data = fs.readFileSync(filePath, 'utf-8');
    data = JSON.parse(data);
    return data;
}

function readFile_cashflow() {
    filePath = path.join(__dirname,"cashflow.json")
    var data = fs.readFileSync(filePath, 'utf-8');
    data = JSON.parse(data);
    return data;
}

function readFile_incomestmt() {
    filePath = path.join(__dirname,"incomestmt.json")
    var data = fs.readFileSync(filePath, 'utf-8');
    data = JSON.parse(data);
    return data;
}

async function saveBalanceSheetQtr(BalanceSheetQtr) {
    BalanceSheetQtr = BalanceSheetQtr.balanceSheetHistoryQuarterly.balanceSheetStatements;
    
    for(var data of BalanceSheetQtr) {
        data['COMPANY_HEADER_ID'] = 1;
    }
    
    const db = await cds.connect.to("db");
    const {BalanceSheet_Qtr} = db.entities;
    db.run(DELETE.from(BalanceSheet_Qtr));
    db.tx().commit();
    db.run(INSERT.into(BalanceSheet_Qtr, BalanceSheetQtr));
    db.tx().commit();
    
}

async function saveIncomeStmtQtr(IncomeStmtQtr) {
    IncomeStmtQtr = IncomeStmtQtr.incomeStatementHistoryQuarterly.incomeStatementHistory;
    for(var data of IncomeStmtQtr) {
        data['COMPANY_HEADER_ID'] = 1;
    }
    const db = await cds.connect.to("db");
    const {IncomeStatements_Qtr} = db.entities;
    db.run(DELETE.from(IncomeStatements_Qtr));
    db.tx().commit();
    db.run(INSERT.into(IncomeStatements_Qtr, IncomeStmtQtr));
    db.tx().commit();
    
}

async function saveCashflowQtr(cashflowQtr) {
    cashflowQtr = cashflowQtr.cashflowStatementHistoryQuarterly.cashflowStatements;
    for(var data of cashflowQtr) {
        data['COMPANY_HEADER_ID'] = 1;
    }
    
    const db = await cds.connect.to("db");
    const {CashflowStatements_Qtr} = db.entities;
    db.run(DELETE.from(CashflowStatements_Qtr));
    db.tx().commit();
    db.run(INSERT.into(CashflowStatements_Qtr, cashflowQtr));
    db.tx().commit();
    
}

module.exports = function () {
    this.on('UpdateBalanceSheet', async () => {
        console.log("Action Called------");
        let BalanceSheetQtr = readFile();
        let cashflowQtr = readFile_cashflow();
        let incomestmtQtr = readFile_incomestmt();
        await saveBalanceSheetQtr(BalanceSheetQtr);
        await saveCashflowQtr(cashflowQtr);
        await saveIncomeStmtQtr(incomestmtQtr);

        
        

    });

    this.on('CalcFinancialRatios',  async (req) => {
        const db = await cds.connect.to("db");
        const {BusinessPartner} = db.entities;
        const {Prediction_Rule} = db.entities;
        var bp = await SELECT.one.from(BusinessPartner).where({ID : req.params[0]})
        var prediction_Rule = await SELECT.from(Prediction_Rule);

        console.log("Calculating Financial Ratios");
        let balanceSheetQtr = readFile();
        balanceSheetQtr = balanceSheetQtr.balanceSheetHistoryQuarterly.balanceSheetStatements;
        let cashflowQtr = readFile_cashflow();
        cashflowQtr = cashflowQtr.cashflowStatementHistoryQuarterly.cashflowStatements;
        let incomestmtQtr = readFile_incomestmt();
        incomestmtQtr = incomestmtQtr.incomeStatementHistoryQuarterly.incomeStatementHistory;
                
        // Creating Business Partnet Object       
        var businessPartner = new business_partner(bp.ID, bp.company_code, bp.company_title, balanceSheetQtr, cashflowQtr, incomestmtQtr, prediction_Rule);
        var financial_ratio = businessPartner.getFinancialRatios();

        const {FinancialRatios_Qtr} = db.entities;
        db.run(DELETE.from(FinancialRatios_Qtr));
        db.tx().commit();
        db.run(INSERT.into(FinancialRatios_Qtr, financial_ratio));
        db.tx().commit();
        
    });

    this.on('PredictIncome', async   (req) => { 
        const db = await cds.connect.to("db");
        const {BusinessPartner} = db.entities;
        const {Prediction_Rule} = db.entities;
        var bp = await SELECT.one.from(BusinessPartner).where({ID : req.params[0]});
        var prediction_Rule = await SELECT.from(Prediction_Rule);

        console.log("Predicting Income Statement");
        // console.log(prediction_Rule);
        let balanceSheetQtr = readFile();
        balanceSheetQtr = balanceSheetQtr.balanceSheetHistoryQuarterly.balanceSheetStatements;
        let cashflowQtr = readFile_cashflow();
        cashflowQtr = cashflowQtr.cashflowStatementHistoryQuarterly.cashflowStatements;
        let incomestmtQtr = readFile_incomestmt();
        incomestmtQtr = incomestmtQtr.incomeStatementHistoryQuarterly.incomeStatementHistory;
        incomestmtQtr.sort(function(a,b){
            return new Date(b.date) - new Date(a.date);
          });
        // Creating Business Partnet Object       
        var businessPartner = new business_partner(bp.ID, bp.company_code, bp.company_title, balanceSheetQtr, cashflowQtr, incomestmtQtr, prediction_Rule);
        var income_STMNT_Predicted = businessPartner.getPredicted_Income_Statements();
        console.log("--------------------------------------------------");
        income_STMNT_Predicted = [...new Set(income_STMNT_Predicted)];
        console.log(income_STMNT_Predicted[1]);
        const {IncomeStmnt_Predicted} = db.entities; 
        db.run(DELETE.from(IncomeStmnt_Predicted));
        db.tx().commit();
        db.run(INSERT.into(IncomeStmnt_Predicted,income_STMNT_Predicted));
        // db.run(INSERT.into(IncomeStmnt_Predicted).columns('COMPANY_HEADER_ID', 'endDate','P_Case').rows(['1','2021-12-31T00:00:00.000Z','Base']));
        db.tx().commit();
        console.log("----------------P R E D I C T I O N----------------------------");
    });
}