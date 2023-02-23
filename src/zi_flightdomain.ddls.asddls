@AbapCatalog.sqlViewName: 'ZIFLIGHTDOMAIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain'

@ObjectModel.compositionRoot: true

@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #SINGLE
@AbapCatalog.buffering.numberOfKeyFields: 1

define view ZI_FlightDomain
  with parameters
    p_DomainName : domname
  as select from dd07l
  association [0..*] to ZI_FlightDomainText as _Text on  _Text.DomainName    = $parameters.p_DomainName
                                                     and _Text.ValuePosition = $projection.ValuePosition
{

      @ObjectModel.text.association: '_Text'
  key $parameters.p_DomainName as DomainName,

  key valpos                   as ValuePosition,

      domvalue_l               as Value,

      domvalue_h               as ValueHigh,

      appval                   as BelongsAppend,

      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Text

}
where
      domname  = $parameters.p_DomainName
  and as4local = 'A'
