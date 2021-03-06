Feature: name
  As a CSL cite processor hacker
  I want the test name_LabelAfterPluralDecorations to pass

  @citation @name
  Scenario: Label After Plural Decorations
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
      <citation 
             et-al-min="2"
             et-al-use-first="1">
        <layout>
          <names variable="editor">
            <name delimiter=", " />
            <label form="long" prefix=" (" suffix=")" />
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"editor":[{"family":"Doe","given":"John","static-ordering":false},{"family":"Roe","given":"Jane","static-ordering":false}],"id":"item-1","issued":{"date-parts":[["2000"]]},"title":"His Anonymous Life","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    John Doe et al. (editors)
    """
