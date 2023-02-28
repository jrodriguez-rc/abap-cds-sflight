@AbapCatalog.sqlViewName: 'ZIFLIGHTBOOKQUER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Query'

@Analytics.query: true
@VDM.viewType: #CONSUMPTION

define view ZI_FlightBookingQuery
  as select from ZI_FlightBookingCube
{
      /** DIMENSIONS **/

      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
  key Airline,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
  key FlightConnection,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
  key FlightDate,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
  key BookNumber,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      Customer,
      @AnalyticsDetails.query.display: #KEY_TEXT
      @AnalyticsDetails.query.axis: #FREE
      TravelAgency,
      @AnalyticsDetails.query.display: #TEXT
      @AnalyticsDetails.query.axis: #FREE
      CustomerCountry,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      CustomerCity,
      @AnalyticsDetails.query.display: #TEXT
      @AnalyticsDetails.query.axis: #FREE
      TravelAgencyCountry,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      TravelAgencyCity,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      Currency,
      @AnalyticsDetails.query.display: #KEY
      @AnalyticsDetails.query.axis: #FREE
      WeightUOM,

      /** MEASURES **/

      TotalOfBookings,
      WeightOfLuggage,
      BookingPrice,

      @EndUserText.label: 'Average Weight Per Flight'
      @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationBehavior: #AVG
      @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationElements: [ 'Airline', 'FlightConnection', 'FlightDate' ]
      @AnalyticsDetails.query.formula: '$projection.WeightOfLuggage'
      @AnalyticsDetails.query.decimals: 0
      0 as AverageWeightPerFlight
}
