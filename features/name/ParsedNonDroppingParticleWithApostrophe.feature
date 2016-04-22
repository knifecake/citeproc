Feature: name
  As a CSL cite processor hacker
  I want the test name_ParsedNonDroppingParticleWithApostrophe to pass

  @citation @name
  Scenario: Parsed Non Dropping Particle With Apostrophe
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0"
          demote-non-dropping-particle="display-and-sort">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout>
          <names variable="author">
            <name name-as-sort-order="all" sort-separator=" ">
              <name-part name="given" prefix="(" suffix=")"/>
              <name-part name="family" font-variant="small-caps"/>
            </name>
          </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"d'Aubignac","given":"François Hédelin"}],"id":"ITEM-1","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    <span style="font-variant:small-caps;">Aubignac</span> (François Hédelin <span style="font-variant:small-caps;">d’</span>)
    """
