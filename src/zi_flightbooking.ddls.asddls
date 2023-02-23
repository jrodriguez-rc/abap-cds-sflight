@AbapCatalog.sqlViewName: 'ZIFLIGHTBOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Booking'

define view ZI_FlightBooking
  as select from sbook
  association [0..1] to ZI_Airline            as _Airline      on  $projection.Airline = _Airline.Airline
  association [0..1] to ZI_FlightConnection   as _Connection   on  $projection.Airline          = _Connection.Airline
                                                               and $projection.FlightConnection = _Connection.FlightConnection
  association [0..1] to ZI_FlightCustomer     as _Customer     on  $projection.Customer = _Customer.Customer
  association [0..1] to ZI_FlightCustomerType as _CustomerType on  $projection.CustomerType = _CustomerType.Type
  association [0..1] to ZI_TravelAgency       as _TravelAgency on  $projection.TravelAgency = _TravelAgency.TravelAgency
{

      @ObjectModel.foreignKey.association: '_Airline'
  key carrid     as Airline,

      @ObjectModel.foreignKey.association: '_Connection'
  key connid     as FlightConnection,

  key fldate     as FlightDate,

  key bookid     as BookNumber,

      @ObjectModel.foreignKey.association: '_Customer'
      customid   as Customer,

      @ObjectModel.foreignKey.association: '_CustomerType'
      custtype   as CustomerType,

      smoker     as Smoker,

      @Semantics.quantity.unitOfMeasure: 'WeightUOM'
      luggweight as WeightOfLuggage,

      @Semantics.unitOfMeasure: true
      wunit      as WeightUOM,

      invoice    as Invoice,

      class      as Class,

      @Semantics.amount.currencyCode: 'ForeignCurrency'
      forcuram   as PriceForeignCurrency,

      @Semantics.currencyCode: true
      forcurkey  as ForeignCurrency,

      @Semantics.amount.currencyCode: 'LocalCurrency'
      loccuram   as PriceLocalCurrency,

      @Semantics.currencyCode: true
      loccurkey  as LocalCurrency,

      order_date as BookingDate,

      counter    as NumberOfSales,

      @ObjectModel.foreignKey.association: '_TravelAgency'
      agencynum  as TravelAgency,

      cancelled  as Cancelled,

      reserved   as Reserved,

      passname   as PassengerName,

      passform   as PassengerFormOfAddress,

      passbirth  as PassengerDateOfBirth,

      // Associations
      _Airline,
      _Connection,
      _Customer,
      _CustomerType,
      _TravelAgency

}
