Feature: variables
  As a CSL cite processor hacker
  I want the test variables_TitleShortOnAbbrevWithTitle to pass

  @citation @variables
  Scenario: Title Short On Abbrev With Title
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
          <text variable="title-short"/>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"My Long Title","type":"book"}]
    """
    And the following abbreviations:
    """
    {"default":{"title":{"My Long Title":"My Short Title"}}}
    """
    When I cite all items
    Then the result should be:
    """
    My Short Title
    """
