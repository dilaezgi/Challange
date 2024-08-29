@Metadata.allowExtensions: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task 1 CDS'
@Search.searchable: true
//@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }
@UI: { headerInfo: { typeName: 'A_Travel', typeNamePlural: 'A_Travel' } }
define view entity ZEZG_DD_TRAVEL_001
  as select from zezg_t001 as Travel
  association [1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.Status = _OverallStatus.OverallStatus
{
  key travel_id                                                                      as TravelId,
      description                                                                    as Description,
      currency_code                                                                  as CurrencyCode,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_price                                                                    as TotalPrice,
      status                                                                         as Status,
      case status
      when 'A' then 3
      when  'O' then 2
      else 1 end                                                                     as CriticalityStatus,
      concat_with_space( cast( total_price as abap.char( 20 ) ) , currency_code, 2 ) as TotalPriceCurrencyConcat,
      _OverallStatus._Text[Language = $session.system_language].Text                 as StatusText,

      _OverallStatus

}
