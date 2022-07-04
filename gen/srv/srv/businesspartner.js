const cds = require('@sap/cds')
const fs = require('fs')
const path = require('path')

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

async function saveBalanceSheetQtr(BalanceSheetQtr) {
    BalanceSheetQtr = BalanceSheetQtr.balanceSheetHistoryQuarterly.balanceSheetStatements;
    
    var ID = 100;
    for(var data of BalanceSheetQtr) {
        data['ID'] = ID;
        data['COMPANY_HEADER_ID'] = 1;
        ID += 1;
    }
    const db = await cds.connect.to("db");
    const {BalanceSheet_Qtr} = db.entities;
    db.run(DELETE.from(BalanceSheet_Qtr));
    db.tx().commit();
    db.run(INSERT.into(BalanceSheet_Qtr, BalanceSheetQtr));
    db.tx().commit();
    
}

async function saveCashflowQtr(cashflowQtr) {
    cashflowQtr = cashflowQtr.cashflowStatementHistoryQuarterly.cashflowStatements;
    
    var ID = 100;
    for(var data of cashflowQtr) {
        data['ID'] = ID;
        data['COMPANY_HEADER_ID'] = 1;
        ID += 1;
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
        await saveBalanceSheetQtr(BalanceSheetQtr);
        await saveCashflowQtr(cashflowQtr);

    })
}