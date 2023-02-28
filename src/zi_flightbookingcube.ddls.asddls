@AbapCatalog.sqlViewName: 'ZIFLIGHTBOOKCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Booking Cube'

@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE

define view ZI_FlightBookingCube
  as select from ZI_FlightBooking
{
  /** DIMENSIONS **/

  @EndUserText.label: 'Airline'
  @ObjectModel.foreignKey.association: '_Airline'
  Airline,

  @EndUserText.label: 'Connection'
  @ObjectModel.foreignKey.association: '_Connection'
  FlightConnection,

  @EndUserText.label: 'Flight Date'
  @ObjectModel.foreignKey.association: '_CalendarDate'
  FlightDate,

  @EndUserText.label: 'Book No.'
  BookNumber,

  @EndUserText.label: 'Customer'
  @ObjectModel.foreignKey.association: '_Customer'
  Customer,

  @EndUserText.label: 'Travel Agency'
  @ObjectModel.foreignKey.association: '_TravelAgency'
  TravelAgency,

  @EndUserText.label: 'Customer Country'
  @ObjectModel.foreignKey.association: '_CustomerCountry'
  _Customer.Country      as CustomerCountry,

  @EndUserText.label: 'Customer City'
  _Customer.City         as CustomerCity,

  @EndUserText.label: 'Travel Agency Country'
  @ObjectModel.foreignKey.association: '_TravelAgencyCountry'
  _TravelAgency.Country  as TravelAgencyCountry,

  @EndUserText.label: 'Travel Agency Customer City'
  _TravelAgency.City     as TravelAgencyCity,

  /** MEASURES **/

  @EndUserText.label: 'Total of Bookings'
  @DefaultAggregation: #SUM
  1                      as TotalOfBookings,

  @EndUserText.label: 'Weight of Luggage'
  @DefaultAggregation: #SUM
  @Semantics.quantity.unitOfMeasure: 'WeightUOM'
  WeightOfLuggage,

  @EndUserText.label: 'Weight Unit'
  @Semantics.unitOfMeasure: true
  WeightUOM,

  @EndUserText.label: 'Booking Price'
  @DefaultAggregation: #SUM
  @Semantics.amount.currencyCode: 'Currency'
  PriceForeignCurrency   as BookingPrice,

  @EndUserText.label: 'Currency'
  @Semantics.currencyCode: true
  ForeignCurrency        as Currency,

  // Associations
  _Airline,
  _Connection,
  _Customer,
  _Customer._Country     as _CustomerCountry,
  _TravelAgency,
  _TravelAgency._Country as _TravelAgencyCountry

}
