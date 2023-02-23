@AbapCatalog.sqlViewName: 'ZIFLIGHTCONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection'

@Analytics.dataCategory: #DIMENSION

define view ZI_FlightConnection
  as select from spfli
  association [0..1] to ZI_Airline as _Airline on $projection.Airline = _Airline.Airline
{

      @ObjectModel.foreignKey.association: '_Airline'
  key carrid                                   as Airline,

      @ObjectModel.text.element: [ 'Destination' ]
  key connid                                   as FlightConnection,

      cityfrom                                 as CityFrom,

      cityto                                   as CityTo,

      @ObjectModel.readOnly: true
      @Semantics.text: true
      concat(cityfrom, concat(' -> ', cityto)) as Destination,

      _Airline
}
