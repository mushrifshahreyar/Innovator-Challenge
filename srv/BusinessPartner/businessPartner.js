
class BusinessPartner{
    #id;
    #code;
    #name;
    #balancesheet_qtr;
    #incomestmt_qtr;
    #cashflow_qtr;
    #financialRatio_qtr = [];

    constructor(id,code,name, balancesheet_qtr, cashflow_qtr, incomestmt_qtr) {
        this.#id = id;
        this.#code = code;
        this.#name = name;
        this.#balancesheet_qtr = balancesheet_qtr;
        this.#cashflow_qtr = cashflow_qtr;
        this.#incomestmt_qtr = incomestmt_qtr;
    }

    getFinancialRatios() {
        this.#calculateZ_Score();
        console.log(this.#financialRatio_qtr);
        return this.#financialRatio_qtr;
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

}

module.exports = BusinessPartner;