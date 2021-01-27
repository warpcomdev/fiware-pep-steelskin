# Copyright 2014 Telefonica Investigación y Desarrollo, S.A.U
#
# This file is part of fiware-pep-steelskin
#
# fiware-pep-steelskin is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the License,
# or (at your option) any later version.
#
# fiware-pep-steelskin is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License along with fiware-pep-steelskin.
# If not, see http://www.gnu.org/licenses/.
#
# For those usages not covered by the GNU Affero General Public License
# please contact with::[iot_support at tid.es]
# __author__ = 'Jon Calderin Goñi (jon dot caldering at gmail dot com)'

@cb_mdwae
Feature: Context broker middleware
  Check if all urls of CB, with the correct user permissions in AC, could connect with CB

  Background:
    Given the Context Broker configuration

  #Standard operations
  Scenario Outline: Create Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/updateContext"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add to the payload the Context Broker action "APPEND" with format "<format>"
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format |
    | xml    |
    | json   |

  Scenario Outline: Update Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/updateContext"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add to the payload the Context Broker action "UPDATE" with format "<format>"
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format |
    | xml    |
    | json   |

  Scenario Outline: Delete Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/updateContext"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add to the payload the Context Broker action "DELETE" with format "<format>"
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format |
    | xml    |
    | json   |

  Scenario Outline: Read Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url              |
    | xml    | /v1/queryContext |
    | json   | /v1/queryContext |
    | xml    | /v1/contextTypes |
    | json   | /v1/contextTypes |

  Scenario Outline: Subscribe Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                           |
    | xml    | /v1/subscribeContext          |
    | json   | /v1/subscribeContext          |
    | xml    | /v1/updateContextSubscription |
    | json   | /v1/updateContextSubscription |
    | xml    | /v1/unsubscribeContext        |
    | json   | /v1/unsubscribeContext        |

  Scenario Outline: Register Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/registry/registerContext"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format |
    | xml    |
    | json   |

  Scenario Outline: Discover Standard operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/registry/discoverContextAvailability"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format |
    | xml    |
    | json   |

  #Convenience operations
  Scenario Outline: Read Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "GET"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                                  |
    | xml    | /v1/contextEntities/EntityID                                         |
    | json   | /v1/contextEntities/EntityID                                         |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName                |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName                |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName/valueID        |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName/valueID        |
    | xml    | /v1/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | json   | /v1/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | xml    | /v1/contextEntityTypes/typeName/attributes/attributeName             |
    | json   | /v1/contextEntityTypes/typeName/attributes/attributeName             |
    | xml    | /v1/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | json   | /v1/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | xml    | /v1/contextEntityTypes/typeName                                      |
    | json   | /v1/contextEntityTypes/typeName                                      |
    | xml    | /v1/contextEntities                                                  |
    | json   | /v1/contextEntities                                                  |
    | xml    | /v1/contextSubscriptions                                             |
    | json   | /v1/contextSubscriptions                                             |
    | xml    | /v1/contextSubscriptions/subscriptionid                              |
    | json   | /v1/contextSubscriptions/subscriptionid                              |
    | xml    | /v1/contextTypes                                                     |
    | json   | /v1/contextTypes                                                     |
    | xml    | /v1/contextTypes/typeName                                            |
    | json   | /v1/contextTypes/typeName                                            |

  Scenario Outline: Update Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "PUT"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                           |
    | xml    | /v1/contextEntities/EntityID                                  |
    | json   | /v1/contextEntities/EntityID                                  |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName         |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName         |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName/valueID |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName/valueID |

  Scenario Outline: Create Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                   |
    | xml    | /v1/contextEntities/EntityID                          |
    | json   | /v1/contextEntities/EntityID                          |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName |
    | xml    | /v1/contextEntities                                   |
    | json   | /v1/contextEntities                                   |

  Scenario Outline: Subscribe Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "<action>"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                     | action |
    | xml    | /v1/contextSubscriptions                | POST   |
    | json   | /v1/contextSubscriptions                | POST   |
    | xml    | /v1/contextSubscriptions/subscriptionID | PUT    |
    | json   | /v1/contextSubscriptions/subscriptionID | PUT    |
    | xml    | /v1/contextSubscriptions/subscriptionID | DELETE |
    | json   | /v1/contextSubscriptions/subscriptionID | DELETE |

  Scenario Outline: Discover Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "GET"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                                           |
    | xml    | /v1/registry/contextEntities/EntityID                                         |
    | json   | /v1/registry/contextEntities/EntityID                                         |
    | xml    | /v1/registry/contextEntities/EntityID/attributes/attributeName                |
    | json   | /v1/registry/contextEntities/EntityID/attributes/attributeName                |
    | xml    | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | json   | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributes/attributeName             |
    | json   | /v1/registry/contextEntityTypes/typeName/attributes/attributeName             |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | json   | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | xml    | /v1/registry/contextEntityTypes/typeName                                      |
    | json   | /v1/registry/contextEntityTypes/typeName                                      |


  Scenario Outline: Register Convenience operation
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                                           |
    | xml    | /v1/registry/contextEntities/EntityID                                         |
    | json   | /v1/registry/contextEntities/EntityID                                         |
    | xml    | /v1/registry/contextEntities/EntityID/attributes/attributeName                |
    | json   | /v1/registry/contextEntities/EntityID/attributes/attributeName                |
    | xml    | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | json   | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName    |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributes/attributeName             |
    | json   | /v1/registry/contextEntityTypes/typeName/attributes/attributeName             |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | json   | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName |
    | xml    | /v1/registry/contextEntityTypes/typeName                                      |
    | json   | /v1/registry/contextEntityTypes/typeName                                      |

  Scenario Outline: Subscribe-availability Convenience operation
   Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "<action>"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                          | action |
    | xml    | /v1/registry/contextAvailabilitySubscriptions                | POST   |
    | json   | /v1/registry/contextAvailabilitySubscriptions                | POST   |
    | xml    | /v1/registry/contextAvailabilitySubscriptions/subscriptionId | PUT    |
    | json   | /v1/registry/contextAvailabilitySubscriptions/subscriptionId | PUT    |
    | xml    | /v1/registry/contextAvailabilitySubscriptions/subscriptionId | DELETE |
    | json   | /v1/registry/contextAvailabilitySubscriptions/subscriptionId | DELETE |

  Scenario Outline: Parameters-Query in cb urls with operation in the payload
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "/v1/updateContext?details=on&limit=15&offset=0"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add to the payload the Context Broker action "<attribute>" with format "<format>"
    And set the request METHOD as "POST"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | attribute |
    | xml    | UPDATE    |
    | json   | UPDATE    |
    | xml    | APPEND    |
    | json   | APPEND    |
    | xml    | DELETE    |
    | json   | DELETE    |

  Scenario Outline: Parameters-Query in cb urls
    Given a KEYSTONE CONFIGURATION with all roles in the same project
    And set the request URL with the path "<url>"
    And set the request HEADERS with the previous KEYSTONE CONFIGURATION ant the format "<format>"
    And add an example of PAYLOAD with "<format>" format
    And set the request METHOD as "<action>"
    When the request built before is sent to PEP
    Then the petition gets to the mock
  Examples:
    | format | url                                                                                                        | action |
    | xml    | /v1/registry/contextAvailabilitySubscriptions?details=on&limit=15&offset=0                                 | POST   |
    | json   | /v1/registry/contextAvailabilitySubscriptions?details=on&limit=15&offset=0                                 | POST   |
    | xml    | /v1/registry/contextAvailabilitySubscriptions/subscriptionId?details=on&limit=15&offset=0                  | PUT    |
    | json   | /v1/registry/contextAvailabilitySubscriptions/subscriptionId?details=on&limit=15&offset=0                  | PUT    |
    | xml    | /v1/registry/contextAvailabilitySubscriptions/subscriptionId?details=on&limit=15&offset=0                  | DELETE |
    | json   | /v1/registry/contextAvailabilitySubscriptions/subscriptionId?details=on&limit=15&offset=0                  | DELETE |
    | xml    | /v1/registry/contextEntities/EntityID?details=on&limit=15&offset=0                                         | POST   |
    | json   | /v1/registry/contextEntities/EntityID?details=on&limit=15&offset=0                                         | POST   |
    | xml    | /v1/registry/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                | POST   |
    | json   | /v1/registry/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                | POST   |
    | xml    | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0    | POST   |
    | json   | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0    | POST   |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0             | POST   |
    | json   | /v1/registry/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0             | POST   |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0 | POST   |
    | json   | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0 | POST   |
    | xml    | /v1/registry/contextEntityTypes/typeName?details=on&limit=15&offset=0                                      | POST   |
    | json   | /v1/registry/contextEntityTypes/typeName?details=on&limit=15&offset=0                                      | POST   |
    | xml    | /v1/registry/contextEntities/EntityID?details=on&limit=15&offset=0                                         | GET    |
    | json   | /v1/registry/contextEntities/EntityID?details=on&limit=15&offset=0                                         | GET    |
    | xml    | /v1/registry/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                | GET    |
    | json   | /v1/registry/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                | GET    |
    | xml    | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0    | GET    |
    | json   | /v1/registry/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0    | GET    |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0             | GET    |
    | json   | /v1/registry/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0             | GET    |
    | xml    | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0 | GET    |
    | json   | /v1/registry/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0 | GET    |
    | xml    | /v1/registry/contextEntityTypes/typeName?details=on&limit=15&offset=0                                      | GET    |
    | json   | /v1/registry/contextEntityTypes/typeName?details=on&limit=15&offset=0                                      | GET    |
    | xml    | /v1/contextSubscriptions?details=on&limit=15&offset=0                                                      | POST   |
    | json   | /v1/contextSubscriptions?details=on&limit=15&offset=0                                                      | POST   |
    | xml    | /v1/contextSubscriptions/subscriptionID?details=on&limit=15&offset=0                                       | PUT    |
    | json   | /v1/contextSubscriptions/subscriptionID?details=on&limit=15&offset=0                                       | PUT    |
    | xml    | /v1/contextSubscriptions/subscriptionID?details=on&limit=15&offset=0                                       | DELETE |
    | json   | /v1/contextSubscriptions/subscriptionID?details=on&limit=15&offset=0                                       | DELETE |
    | xml    | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | POST   |
    | json   | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | POST   |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | POST   |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | POST   |
    | xml    | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | PUT    |
    | json   | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | PUT    |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | PUT    |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | PUT    |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName/valueID?details=on&limit=15&offset=0                 | PUT    |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName/valueID?details=on&limit=15&offset=0                 | PUT    |
    | xml    | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | GET    |
    | json   | /v1/contextEntities/EntityID?details=on&limit=15&offset=0                                                  | GET    |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | GET    |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName?details=on&limit=15&offset=0                         | GET    |
    | xml    | /v1/contextEntities/EntityID/attributes/attributeName/valueID?details=on&limit=15&offset=0                 | GET    |
    | json   | /v1/contextEntities/EntityID/attributes/attributeName/valueID?details=on&limit=15&offset=0                 | GET    |
    | xml    | /v1/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0             | GET    |
    | json   | /v1/contextEntities/EntityID/attributeDomains/attributeDomainName?details=on&limit=15&offset=0             | GET    |
    | xml    | /v1/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0                      | GET    |
    | json   | /v1/contextEntityTypes/typeName/attributes/attributeName?details=on&limit=15&offset=0                      | GET    |
    | xml    | /v1/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0          | GET    |
    | json   | /v1/contextEntityTypes/typeName/attributeDomains/attributeDomainName?details=on&limit=15&offset=0          | GET    |
    | xml    | /v1/contextEntityTypes/typeName?details=on&limit=15&offset=0                                               | GET    |
    | json   | /v1/contextEntityTypes/typeName?details=on&limit=15&offset=0                                               | GET    |
    | xml    | /v1/registry/subscribeContextAvailability?details=on&limit=15&offset=0                                     | POST   |
    | json   | /v1/registry/subscribeContextAvailability?details=on&limit=15&offset=0                                     | POST   |
    | xml    | /v1/registry/updateContextAvailabilitySubscription?details=on&limit=15&offset=0                            | POST   |
    | json   | /v1/registry/updateContextAvailabilitySubscription?details=on&limit=15&offset=0                            | POST   |
    | xml    | /v1/registry/unsubscribeContextAvailability?details=on&limit=15&offset=0                                   | POST   |
    | json   | /v1/registry/unsubscribeContextAvailability?details=on&limit=15&offset=0                                   | POST   |
    | xml    | /v1/registry/discoverContextAvailability?details=on&limit=15&offset=0                                      | POST   |
    | json   | /v1/registry/discoverContextAvailability?details=on&limit=15&offset=0                                      | POST   |
    | xml    | /v1/registry/registerContext?details=on&limit=15&offset=0                                                  | POST   |
    | json   | /v1/registry/registerContext?details=on&limit=15&offset=0                                                  | POST   |
    | xml    | /v1/subscribeContext?details=on&limit=15&offset=0                                                          | POST   |
    | json   | /v1/subscribeContext?details=on&limit=15&offset=0                                                          | POST   |
    | xml    | /v1/updateContextSubscription?details=on&limit=15&offset=0                                                 | POST   |
    | json   | /v1/updateContextSubscription?details=on&limit=15&offset=0                                                 | POST   |
    | xml    | /v1/unsubscribeContext?details=on&limit=15&offset=0                                                        | POST   |
    | json   | /v1/unsubscribeContext?details=on&limit=15&offset=0                                                        | POST   |
    | xml    | /v1/queryContext?details=on&limit=15&offset=0                                                              | POST   |
    | json   | /v1/queryContext?details=on&limit=15&offset=0                                                              | POST   |
    | xml    | /v1/contextTypes?details=on&limit=15&offset=0                                                              | GET    |
    | json   | /v1/contextTypes?details=on&limit=15&offset=0                                                              | GET    |


    
   


