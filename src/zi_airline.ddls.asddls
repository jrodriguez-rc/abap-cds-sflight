@AbapCatalog.sqlViewName: 'ZIAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'

@Analytics: { dataCategory: #DIMENSION }
@VDM.viewType: #BASIC

@ObjectModel.representativeKey: 'Airline'
//@ObjectModel.usageType.sizeCategory: #S
//@ObjectModel.usageType.dataClass:  #MASTER
//@ObjectModel.usageType.serviceQuality: #A
//@ObjectModel.compositionRoot:true
//@Search.searchable: true
//@ObjectModel.resultSet.sizeCategory: #XS

//@ClientHandling.algorithm: #SESSION_VARIABLE
//@AbapCatalog.buffering.status: #ACTIVE
//@AbapCatalog.buffering.type: #FULL
//@AbapCatalog.buffering.numberOfKeyFields: 1

define view ZI_Airline
  as select from scarr
{

      @ObjectModel.text.element: [ 'AirlineName' ]
      @Search.defaultSearchElement: true
  key carrid   as Airline,

      @Semantics.text: true
      @Search.defaultSearchElement: true
      carrname as AirlineName,

      @Semantics.currencyCode: true
      currcode as Currency,

      url      as URL

}
