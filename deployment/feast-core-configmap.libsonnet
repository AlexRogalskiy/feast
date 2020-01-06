{
 data: |||
     feast:
       jobs:
         metrics:
           enabled: false
           host: localhost
           port: 9125
           type: statsd
         options: {}
         runner: DirectRunner
         updates:
           timeoutSeconds: 240
       stream:
         options:
           bootstrapServers: {{ env.bootstrapUrl }}
           partitions: 1
           replicationFactor: 1
           topic: feast
         type: kafka
     grpc:
       enable-reflection: true
       port: 6565
     management:
       metrics:
         export:
           simple:
             enabled: false
           statsd:
             enabled: false
             host: localhost
             port: 8125
     spring:
       datasource:
         driverClassName: org.postgresql.Driver
         password: PASSWORD
         url: jdbc:postgresql://{{ metadata.release }}-postgresql:5432/feast
         username: USERNAME
       jpa:
         hibernate.ddl-auto: update
         hibernate.naming.physical-strategy=org.hibernate.boot.model.naming: PhysicalNamingStrategyStandardImpl
         properties.hibernate.event.merge.entity_copy_observer: allow
         properties.hibernate.format_sql: true
 |||
}
