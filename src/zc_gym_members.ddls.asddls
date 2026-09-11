@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista de Proyeccion - Miembros Gym'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: false

define root view entity ZC_GYM_MEMBERS
  provider contract transactional_query
  as projection on ZI_GYM_MEMBERS
{
  key ClientId,
      IdCard,
      FirstName,
      LastName,
      
      
      
      @Semantics.telephone.type: [#CELL]
      PhoneNumber,
      
      @Semantics.eMail.address: true
      Email,
      
      
      BirthDate,
      ExpirationDate,
      
     
      
      
     
      @Consumption.valueHelpDefinition: [{
        entity: {
          name: 'ZI_TRAINER_VH',
          element: 'Code'
        }
      }]
      HasPersonalTrainer, 
      PaymentStatus,
      PaymentCriticality
      
}
