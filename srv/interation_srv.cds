using app.interactions from '../db/interactions';
service CatalogService {

 entity Interactions_Header
	as projection on interactions.Company;

 entity Interactions_Items
	as projection on  interactions.Cashflow_Qtr;

}