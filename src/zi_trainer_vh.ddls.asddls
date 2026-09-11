@ObjectModel.dataCategory: #VALUE_HELP
@EndUserText.label: 'Value Help Entrenadores'
@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZI_TRAINER_VH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE( p_domain_name: 'ZDO_PERSONAL_TRAINER' ) as Val
  left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDO_PERSONAL_TRAINER' ) as Txt 
    on  Txt.domain_name    = Val.domain_name
    and Txt.value_position = Val.value_position
    and Txt.language       = $session.system_language
{
  @ObjectModel.text.element: [ 'Text' ]
  key Val.value_low as Code,
      @Search.defaultSearchElement: true
      Txt.text      as Text
}
