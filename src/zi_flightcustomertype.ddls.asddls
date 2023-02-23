@AbapCatalog.sqlViewName: 'ZIFLIGHTCUSTOMTY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Type'

@Analytics: { dataCategory: #DIMENSION }
@VDM.viewType: #BASIC

@ObjectModel.representativeKey: 'Type'
@ObjectModel.usageType.sizeCategory: #S
@ObjectModel.usageType.dataClass:  #MASTER
@ObjectModel.usageType.serviceQuality: #A
@ObjectModel.compositionRoot:true
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS

define view ZI_FlightCustomerType
  as select from ZI_FlightDomainDim( p_DomainName : 'S_CUSTTYPE' )
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Description']
  key cast( substring(Value, 1, 1) as s_custtype preserving type ) as Type,

      Description

}
