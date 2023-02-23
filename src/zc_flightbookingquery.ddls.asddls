@AbapCatalog.sqlViewName: 'ZCFLIGHTBOOKQUER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Booking Query'

@Analytics.query: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true

@UI: {
  headerInfo: {
    typeName: 'Booking',
    typeNamePlural: 'Bookings',
    title: {
        type: #STANDARD,
        label: 'Airline',
        value: 'Airline'
    },
    description: {
        type: #STANDARD,
        label: 'Flight Connection',
        value: 'FlightConnection'
    }
  }
}

@UI.chart: [{
    qualifier: 'ChartAirline',
    chartType: #COLUMN,
    description: 'By Airline',
    dimensions: ['PurchasingGroup'],
    measures: ['TotalOfBookings','WeightOfLuggage','BookingPrice'],
    measureAttributes: [{
        measure: 'TotalOfBookings',
        role: #AXIS_1,
        asDataPoint: true
    },{
        measure: 'WeightOfLuggage',
        role: #AXIS_2,
        asDataPoint: true
    },{
        measure: 'BookingPrice',
        role: #AXIS_3,
        asDataPoint: true
    }]
}]

@UI.presentationVariant:[{
    qualifier: 'KPIAirline',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartAirline'
    }]
}]

@UI.selectionVariant: [{
    qualifier: 'KPIAirline',
    text: 'KPI Airline'
}]

@UI.selectionPresentationVariant: [{
    id: 'KPIAirline',
    qualifier: 'KPIAirline',
    presentationVariantQualifier: 'KPIAirline',
    selectionVariantQualifier: 'KPIAirline',
    text: 'Airline'
}]

define view ZC_FlightBookingQuery
  as select from ZI_FlightBookingCube
{

  /** DIMENSIONS **/

  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  Airline,

  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  FlightConnection,

  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  FlightDate,

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
  BookingPrice

  //  @EndUserText.label: 'Average Weight Per Flight'
  //  @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationBehavior: #AVG
  //  @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationElements: [ 'Airline', 'FlightConnection', 'FlightDate' ]
  //  @AnalyticsDetails.query.formula: '$projection.WeightOfLuggage'
  //  @AnalyticsDetails.query.decimals: 0
  //  0 as AverageWeightPerFlight

}
