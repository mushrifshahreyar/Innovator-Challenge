
exports.module = class FinancialRatio {
    #endDate;
    #zscore;
    #currentRatio;
    #quickRatio;
    #ebitda;
    #returnOnSales;

    set endDate(endDate) {
        this.#endDate = endDate;
    }
    get endDate() {
        return this.#endDate;
    }

    set zScore(zscore) {
        this.#zscore = zscore;
    }

    get zScore() {
        return this.#zscore;
    }

    set currentRation(currentRatio) {
        this.#currentRatio = currentRatio;
    }

    get currentRation() {
        return this.#currentRatio;
    }

    set quickRatio() {
        this.#quickRatio = quickRatio;
    }

    get quickRatio() {
        return this.#quickRatio;
    }

    set ebitda(ebitda) {
        this.#ebitda = ebitda;
    }

    get ebitda() {
        return this.#ebitda;
    }

    set returnOnSales(returnOnSales) {
        this.#returnOnSales = returnOnSales;
    }

    get returnOnSales() {
        return this.#returnOnSales;
    }

    
}