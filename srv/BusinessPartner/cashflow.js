class cashflow {
    constructor(
                endDate,
                maxAge,
                netIncome,
                depreciation,
                changeToNetincome,
                changeToAccountReceivables,
                changeToLiabilities,
                changeToInventory,
                changeToOperatingActivities,
                totalCashFromOperatingActivities,
                capitalExpenditures,
                investments,
                totalCashflowsFromInvestingActivities,
                netBorrowings,
                otherCashflowsFromFinancingActivities,
                totalCashFromFinancingActivities,
                effectOfExchangeRate,
                changeInCash,
                issuanceOfStock
            ) {
                this.endDate = endDate;
                this.maxAge = maxAge;
                this.netIncome = netIncome;
                this.depreciation = depreciation; // *
                this.changeToNetincome = changeToNetincome; // *
                this.changeToAccountReceivables = changeToAccountReceivables; // *
                this.changeToLiabilities = changeToLiabilities;
                this.changeToInventory = changeToInventory; // *
                this.changeToOperatingActivities = changeToOperatingActivities;
                this.totalCashFromOperatingActivities = totalCashFromOperatingActivities; // *
                this.capitalExpenditures = capitalExpenditures;
                this.investments = investments;
                this.totalCashflowsFromInvestingActivities = totalCashflowsFromInvestingActivities; // *
                this.netBorrowings = netBorrowings; // *
                this.otherCashflowsFromFinancingActivities = otherCashflowsFromFinancingActivities; // *
                this.totalCashFromFinancingActivities = totalCashFromFinancingActivities;
                this.effectOfExchangeRate = effectOfExchangeRate; // *
                this.changeInCash = changeInCash;
                this.issuanceOfStock = issuanceOfStock;
    }
}