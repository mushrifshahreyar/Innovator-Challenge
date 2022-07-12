module.exports = class balancesheet {
    endDate;
    maxAge;
    cash;
    shortTermInvestments;
    netReceivables;
    inventory;
    otherCurrentAssets;
    totalCurrentAssets;
    propertyPlantEquipment;
    goodWill;              
    intangibleAssets;      
    otherAssets;           
    totalAssets;           
    accountsPayable;       
    shortLongTermDebt;     
    otherCurrentLiab;      
    longTermDebt;          
    otherLiab;             
    minorityInterest;      
    totalCurrentLiabilities;
    totalLiab;
    commonStock;            
    retainedEarnings;       
    treasuryStock;      
    capitalSurplus;         
    otherStockholderEquity; 
    totalStockholderEquity;
    netTangibleAssets;

    constructor(
        endDate, 
        maxAge, 
        cash, 
        shortTermInvestments, 
        netReceivables,
        inventory,
        otherCurrentAssets,
        totalCurrentAssets,
        propertyPlantEquipment,
        goodWill,
        intangibleAssets,
        otherAssets,           
        totalAssets,           
        accountsPayable,       
        shortLongTermDebt,     
        otherCurrentLiab,      
        longTermDebt,          
        otherLiab,             
        minorityInterest,      
        totalCurrentLiabilities,
        totalLiab,
        commonStock,            
        retainedEarnings,       
        treasuryStock,      
        capitalSurplus,         
        otherStockholderEquity, 
        totalStockholderEquity,
        netTangibleAssets
    ) {
        this.endDate = endDate;
        this.maxAge = maxAge; 
        this.cash = cash;
        this.shortTermInvestments = shortTermInvestments; 
        this.netReceivables = netReceivables;
        this.inventory = inventory;
        this.otherCurrentAssets = otherCurrentAssets;
        this.totalCurrentAssets = totalCurrentAssets;
        this.propertyPlantEquipment = propertyPlantEquipment;
        this.goodWill = goodWill;
        this.intangibleAssets = intangibleAssets;
        this.otherAssets = otherAssets;           
        this.totalAssets = totalAssets;           
        this.accountsPayable = accountsPayable;       
        this.shortLongTermDebt = shortLongTermDebt;     
        this.otherCurrentLiab = otherCurrentLiab;      
        this.longTermDebt = longTermDebt;          
        this.otherLiab = otherLiab;             
        this.minorityInterest = minorityInterest;      
        this.totalCurrentLiabilities = totalCurrentLiabilities;
        this.totalLiab = totalLiab;
        this.commonStock = commonStock;           
        this.retainedEarnings = retainedEarnings;
        this.treasuryStock = treasuryStock;
        this.capitalSurplus = capitalSurplus;         
        this.otherStockholderEquity = otherStockholderEquity;
        this.totalStockholderEquity = totalStockholderEquity;
        this.netTangibleAssets = netTangibleAssets;
    }
    
}