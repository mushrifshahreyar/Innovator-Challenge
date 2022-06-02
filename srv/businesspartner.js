const cds = require('@sap/cds')

module.exports = function () {
    this.after('READ', 'BusinessPartner', each => {
        console.log(each.company_code);
    })
}
