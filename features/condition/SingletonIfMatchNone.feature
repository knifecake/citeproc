Feature: condition
  As a CSL cite processor hacker
  I want the test condition_SingletonIfMatchNone to pass

  @citation @condition
  Scenario: Singleton If Match None
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
          <choose>
            <if variable="container-author" match="none"/>
            <else-if variable="author" match="any">
              <names variable="editor" delimiter=", ">
                <label form="verb-short" suffix=" " text-case="lowercase"/>
                <name and="text" delimiter=", "/>
              </names>
            </else-if>
          </choose>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Άγρας","given":"Τέλλος"}],"container-author":[{"family":"Καρυωτάκης ","given":"Κώστας"}],"editor":[{"family":"Σαββίδης","given":"Γ. Π."}],"id":"ITEM-1","type":"chapter"}]
    """
    When I cite all items
    Then the result should be:
    """
    ed. Γ. Π. Σαββίδης
    """
