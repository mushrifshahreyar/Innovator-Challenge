const cds = require('@sap/cds')

module.exports = function () {
    this.on('UpdateBalanceSheet', async () => {
        console.log("Action Called---");
        const db = await cds.connect.to("db");
        const { BusinessPartner } = db.entities;
        db.run(INSERT.into(BusinessPartner, [
            {ID: 203, company_title: 'Test3', company_code: 'TST3'}
        ]));
        db.tx().commit();
    })
}