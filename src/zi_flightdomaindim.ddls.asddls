@AbapCatalog.sqlViewName: 'ZIFLIGHTDOMAINDI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain Dimension'

define view ZI_FlightDomainDim
  with parameters
    p_DomainName : domname
  as select from ZI_FlightDomain( p_DomainName : $parameters.p_DomainName )
{

  key DomainName,

  key ValuePosition,

      Value,

      ValueHigh,

      BelongsAppend,

      _Text[ 1: Language = $session.system_language ].ShortText as Description,

      /* Associations */
      _Text

}
