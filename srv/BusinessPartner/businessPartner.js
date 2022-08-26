
class BusinessPartner{
    #id;
    #code;
    #name;
    #balancesheet_qtr;
    #incomestmt_qtr;
    #cashflow_qtr;
    #financialRatio_qtr = [];
    #PredictedINCM_Statement_qtr = [];
    #Prediction_Rules = [];

    constructor(id,code,name, balancesheet_qtr, cashflow_qtr, incomestmt_qtr, PredictionRules) {
        this.#id = id;
        this.#code = code;
        this.#name = name;
        this.#balancesheet_qtr = balancesheet_qtr;
        this.#cashflow_qtr = cashflow_qtr;
        this.#incomestmt_qtr = incomestmt_qtr;
        this.#Prediction_Rules = PredictionRules;
    }

    getFinancialRatios() {
        this.#calculateZ_Score();
        console.log(this.#financialRatio_qtr);
        return this.#financialRatio_qtr;
    }

    getPredicted_Income_Statements() {
        this.#Predict_Income_STMNT();
        console.log(this.#PredictedINCM_Statement_qtr);
        return this.#PredictedINCM_Statement_qtr;
    }

    #calculateZ_Score() {
        for(var data of this.#balancesheet_qtr) {
            var fr_t = {};
            fr_t['COMPANY_HEADER_ID'] = this.#id;
            fr_t['endDate'] = data.endDate;
            fr_t['zscore'] = ((data.totalCurrentAssets - data.totalCurrentLiabilities)/data.totalAssets) * 0.65 +
                             (data.retainedEarnings / data.totalAssets) * 3.26;
            fr_t['zscore'] = fr_t['zscore'].toFixed(2);

            fr_t['currentRatio'] = data.totalCurrentAssets / data.totalCurrentLiabilities;
            fr_t['currentRatio'] = fr_t['currentRatio'].toFixed(2);

            fr_t['quickRatio'] = data.totalCurrentLiabilities / data.totalCurrentLiabilities * 4.3;
            fr_t['quickRatio'] = fr_t['quickRatio'].toFixed(2);

            fr_t['ebitda'] = data.propertyPlantEquipment / data.totalCurrentLiabilities;
            fr_t['ebitda'] = fr_t['ebitda'].toFixed(2);

            fr_t['returnOnSales'] = data.totalLiab / data.totalCurrentLiabilities;
            fr_t['returnOnSales'] = fr_t['returnOnSales'].toFixed(2);

            this.#financialRatio_qtr.push(fr_t)
        }
    }

    #Predict_Income_STMNT() {
        for( var rule of this.#Prediction_Rules) {
            // console.log(rule.Sales_Growth);
           
            for(var data of this.#incomestmt_qtr) {
                var IncmStmnt_P = {};
                IncmStmnt_P['COMPANY_HEADER_ID'] = this.#id;
                var _date = new Date(data.endDate);
                var yearFromDate = _date.getFullYear();
                var monthFromYear = _date.getMonth();
                var dayFromYear = _date.getDate();
                var newDate = new Date(yearFromDate + 1, monthFromYear, dayFromYear);
                IncmStmnt_P['endDate'] = newDate;
                IncmStmnt_P['P_Case'] = rule.P_Case;
                IncmStmnt_P['totalRevenue'] = (parseFloat(data.totalRevenue ) + parseFloat(data.totalRevenue * rule.Sales_Growth ) / 100 ).toFixed(2) ;
                IncmStmnt_P['costOfGoodSold'] = (parseFloat(data.costOfRevenue * rule.COGS_Margin)/100 ).toFixed(2);
                IncmStmnt_P['SG_A_Expense'] = (parseFloat( data.sellingGeneralAdministrative * rule.Cost_Inflation )/100).toFixed(2);
                IncmStmnt_P['R_D_Expense'] = (parseFloat(data.researchDevelopment)).toFixed(2);
                IncmStmnt_P['otherOperatingIncomeExpense'] = (parseFloat( data.totalOperatingExpenses * rule.Cost_Inflation)/100).toFixed(2);
                IncmStmnt_P['operatingProfit'] = (  parseFloat(IncmStmnt_P['totalRevenue']) - (  parseFloat(IncmStmnt_P['costOfGoodSold']) +  parseFloat(IncmStmnt_P['SG_A_Expense']) + 
                parseFloat(IncmStmnt_P['R_D_Expense']) +  parseFloat(IncmStmnt_P['otherOperatingIncomeExpense']) )).toFixed(2);
                IncmStmnt_P['interestincome'] = (parseFloat(data.incomeBeforeTax* rule.Cost_Inflation)/100).toFixed(2);
                IncmStmnt_P['interestExpense'] = (parseFloat( data.interestExpense * rule.Cost_Inflation)/100).toFixed(2);
                IncmStmnt_P['OtherIncomeExpense'] = (parseFloat(data.totalOtherIncomeExpenseNet * rule.Cost_Inflation)/100).toFixed(2);
                IncmStmnt_P['incomeTax'] = ((( parseFloat(IncmStmnt_P['operatingProfit']) +  parseFloat(IncmStmnt_P['interestincome']) -  parseFloat(IncmStmnt_P['interestincome']) +  parseFloat(IncmStmnt_P['interestExpense']) ) * rule.Taxes)/100 ).toFixed(2);
                IncmStmnt_P['netIncomeAfterTax'] = ((  parseFloat(IncmStmnt_P['operatingProfit']) +  parseFloat(IncmStmnt_P['interestincome']) -  parseFloat(IncmStmnt_P['interestincome']) +  parseFloat(IncmStmnt_P['interestExpense']) -  parseFloat(IncmStmnt_P['incomeTax']) )).toFixed(2);
                this.#PredictedINCM_Statement_qtr.push(IncmStmnt_P)
                // ---------------------P R E D I C T I O N - N E X T - 4 - Y E A R S-----------------
                for (let i = 1; i < 5; i++) {
                    let L_IncmStmnt_P = IncmStmnt_P ;
                    IncmStmnt_P = {};
                    var _date = new Date(L_IncmStmnt_P['endDate']);
                    var yearFromDate = _date.getFullYear();
                    var monthFromYear = _date.getMonth();
                    var dayFromYear = _date.getDate();
                    var newDate = new Date(yearFromDate + 1, monthFromYear, dayFromYear);
                    IncmStmnt_P['COMPANY_HEADER_ID'] = L_IncmStmnt_P['COMPANY_HEADER_ID'];
                    IncmStmnt_P['endDate'] = newDate;
                    IncmStmnt_P['P_Case'] = rule.P_Case;
                    IncmStmnt_P['totalRevenue'] = (parseFloat(L_IncmStmnt_P['totalRevenue']) + (parseFloat(L_IncmStmnt_P['totalRevenue']) * rule.Sales_Growth ) / 100 ).toFixed(2) ;
                    IncmStmnt_P['costOfGoodSold'] = ((parseFloat(L_IncmStmnt_P['costOfGoodSold']) * rule.COGS_Margin)/100 ).toFixed(2);
                    IncmStmnt_P['SG_A_Expense'] = (( parseFloat(L_IncmStmnt_P['SG_A_Expense']) * rule.Cost_Inflation )/100).toFixed(2);
                    IncmStmnt_P['R_D_Expense'] = (parseFloat(L_IncmStmnt_P['R_D_Expense'])).toFixed(2);
                    IncmStmnt_P['otherOperatingIncomeExpense'] = (( parseFloat(L_IncmStmnt_P['otherOperatingIncomeExpense']) * rule.Cost_Inflation)/100).toFixed(2);
                    IncmStmnt_P['operatingProfit'] = (  parseFloat(IncmStmnt_P['totalRevenue']) - (  parseFloat(IncmStmnt_P['costOfGoodSold']) +  parseFloat(IncmStmnt_P['SG_A_Expense']) + 
                    parseFloat(IncmStmnt_P['R_D_Expense']) +  parseFloat(IncmStmnt_P['otherOperatingIncomeExpense']) )).toFixed(2);
                    IncmStmnt_P['interestincome'] = ((parseFloat(L_IncmStmnt_P['interestincome'])* rule.Cost_Inflation)/100).toFixed(2);
                    IncmStmnt_P['interestExpense'] = (( parseFloat(L_IncmStmnt_P['interestExpense']) * rule.Cost_Inflation)/100).toFixed(2);
                    IncmStmnt_P['OtherIncomeExpense'] = (( parseFloat(L_IncmStmnt_P['OtherIncomeExpense']) * rule.Cost_Inflation)/100).toFixed(2);
                    IncmStmnt_P['incomeTax'] = (( (  parseFloat(IncmStmnt_P['operatingProfit']) +  parseFloat(IncmStmnt_P['interestincome']) -  parseFloat(IncmStmnt_P['interestincome']) +  parseFloat(IncmStmnt_P['interestExpense']) ) * rule.Taxes)/100 ).toFixed(2);
                    IncmStmnt_P['netIncomeAfterTax'] = ((  parseFloat(IncmStmnt_P['operatingProfit']) +  parseFloat(IncmStmnt_P['interestincome']) -  parseFloat(IncmStmnt_P['interestincome']) +  parseFloat(IncmStmnt_P['interestExpense']) -  parseFloat(IncmStmnt_P['incomeTax']) )).toFixed(2);
                    this.#PredictedINCM_Statement_qtr.push(IncmStmnt_P)
                }
                // ------------------------------------------------------------------------------------------------------------------------
               
                break;
            }
        }
    }

}

module.exports = BusinessPartner;