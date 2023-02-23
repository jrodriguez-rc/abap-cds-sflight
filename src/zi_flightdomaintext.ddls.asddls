@AbapCatalog.sqlViewName: 'ZIFLIGHTDOMAINTX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Text'
@ObjectModel.dataCategory: #TEXT

@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 2

define view ZI_FlightDomainText
  as select from dd07t
  association [1..1] to ZI_FlightDomain as _Domain on  _Domain.DomainName    = $projection.DomainName
                                                   and _Domain.ValuePosition = $projection.ValuePosition
{

  key domname    as DomainName,

      @Semantics.language: true
  key ddlanguage as Language,

  key valpos     as ValuePosition,

  key as4vers    as Version,

      @Semantics.text: true
      ddtext     as ShortText,

      domval_ld  as ValueLow,

      domval_hd  as ValueHigh,

      domvalue_l as Value,

      @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
      _Domain

}
where
  as4local = 'A'
