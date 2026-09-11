@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista de Interfaz - Miembros Gym'
define root view entity ZI_GYM_MEMBERS
  as select from zgym_members
{
  key client_id            as ClientId,

      id_card              as IdCard,
      first_name           as FirstName,
      last_name            as LastName,
      phone_number         as PhoneNumber,
      email                as Email,
      birth_date           as BirthDate,

      expiration_date      as ExpirationDate,
      has_personal_trainer as HasPersonalTrainer,

      /* LÓGICA DE ALERTA DE PAGO */
      case
        when expiration_date < $session.system_date then 'Vencido'
        else 'Al día'
      end                  as PaymentStatus,

      /* COLOR DE CRITICIDAD PARA FIORI (1 = Rojo, 3 = Verde) */
      case
        when expiration_date < $session.system_date then 1
        else 3
      end                  as PaymentCriticality
      
}
