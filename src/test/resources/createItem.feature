Feature: Item
  @Marcos
  Scenario: As a user I want to create Items so that projects my task

    Given I have authentication to todo.ly
    # consumiendo el request
    When I send POST request 'api/items.json' with json
    """
    {
       "Content":"Item10"
    }
    """
    # verificar el response
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
              "Id": "EXCLUDE",
              "Content": "Item10",
              "ItemType": 1,
              "Checked": false,
              "ProjectId": null,
              "ParentId": null,
              "Path": "",
              "Collapsed": false,
              "DateString": null,
              "DateStringPriority": 0,
              "DueDate": "",
              "Recurrence": null,
              "ItemOrder": null,
              "Priority": 4,
              "LastSyncedDateTime": "EXCLUDE",
              "Children": [],
              "DueDateTime": null,
              "CreatedDate": "EXCLUDE",
              "LastCheckedDate": null,
              "LastUpdatedDate": "EXCLUDE",
              "Deleted": false,
              "Notes": "",
              "InHistory": false,
              "SyncClientCreationId": null,
              "DueTimeSpecified": true,
              "OwnerId": 676085
    }
    """

    And I get the property value 'Id' and save on ID_PROJECT
    And I get the property value 'Content' and save on NAME_PROJECT

    When I send PUT request 'api/items/ID_PROJECT.json' with json
    """
    {
       "Content":"NAME_PROJECT UPDATE",
    }
    """

    # verificar el response

    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
          "Id": ID_PROJECT,
          "Content": "NAME_PROJECT UPDATE",
          "ItemType": 1,
          "Checked": false,
          "ProjectId": null,
          "ParentId": null,
          "Path": "",
          "Collapsed": false,
          "DateString": null,
          "DateStringPriority": 0,
          "DueDate": "",
          "Recurrence": null,
          "ItemOrder": null,
          "Priority": 4,
          "LastSyncedDateTime": "EXCLUDE",
          "Children": [],
          "DueDateTime": null,
          "CreatedDate": "EXCLUDE",
          "LastCheckedDate": null,
          "LastUpdatedDate": "EXCLUDE",
          "Deleted": false,
          "Notes": "",
          "InHistory": false,
          "SyncClientCreationId": null,
          "DueTimeSpecified": true,
          "OwnerId": 676085
    }
    """
    When I send GET request 'api/items/ID_PROJECT.json' with json
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
          "Id": ID_PROJECT,
          "Content": "NAME_PROJECT UPDATE",
          "ItemType": 1,
          "Checked": false,
          "ProjectId": null,
          "ParentId": null,
          "Path": "",
          "Collapsed": false,
          "DateString": null,
          "DateStringPriority": 0,
          "DueDate": "",
          "Recurrence": null,
          "ItemOrder": null,
          "Priority": 4,
          "LastSyncedDateTime": "EXCLUDE",
          "Children": [],
          "DueDateTime": null,
          "CreatedDate": "EXCLUDE",
          "LastCheckedDate": null,
          "LastUpdatedDate": "EXCLUDE",
          "Deleted": false,
          "Notes": "",
          "InHistory": false,
          "SyncClientCreationId": null,
          "DueTimeSpecified": true,
          "OwnerId": 676085
    }
    """

    When I send DELETE request 'api/items/ID_PROJECT.json' with json
    """
    """
    Then I expected the response code 200