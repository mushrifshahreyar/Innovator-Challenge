const cds = require('@sap/cds')
const fs = require('fs')
const path = require('path')

function readFile() {
    filePath = path.join(__dirname,"data.json")
    var data = fs.readFileSync(filePath, 'utf-8');
    data = JSON.parse(data);
    return data;
}

async function saveBalanceSheetQtr(BalanceSheetQtr) {
    BalanceSheetQtr = BalanceSheetQtr.balanceSheetHistoryQuarterly.balanceSheetStatements;
    
    var ID = 400;
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

module.exports = function () {
    this.on('UpdateBalanceSheet', async () => {
        // console.log("Action Called---");
        // const db = await cds.connect.to("db");
        // const { BusinessPartner } = db.entities;
        // db.run(INSERT.into(BusinessPartner, [
        //     {ID: 203, company_title: 'Test3', company_code: 'TST3'}
        // ]));
        // db.tx().commit();

        console.log("Action Called------");
        let BalanceSheetQtr = readFile();
        await saveBalanceSheetQtr(BalanceSheetQtr);

    })
}