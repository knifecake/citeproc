Feature: flipflop
  As a CSL cite processor hacker
  I want the test flipflop_ItalicsWithOkAndTextcase to pass

  @bibliography @flipflop
  Scenario: Italics With Ok And Textcase
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
    		<text variable="title" suffix=". " font-style="italic"/>
          	<text value="BOGUS"/>
        </layout>
      </citation>
      <bibliography>
        <layout>
          <group suffix=".">
            <text variable="title" suffix=". " font-variant="small-caps" text-case="capitalize-all"/>
            <date variable="issued" date-parts="year" form="text" suffix=". "/>
            <text variable="volume" suffix=" "/>
            <text variable="container-title"/>
            <text variable="page-first" prefix=" "/>
            <text variable="authority" prefix=" (" suffix=")"/>
          </group>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"authority":"E.D. Wisc.","container-title":"F. Supp.","id":"ITEM-1","issued":{"date-parts":[[1972]]},"page":"1078-1100","title":"lessard <span class=\"nodecor\">v.</span> schmidt","type":"legal_case","volume":"349"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry"><span style="font-variant:small-caps;">Lessard <span style="font-variant:normal;">v.</span> Schmidt</span>. 1972. 349 F. Supp. 1078 (E.D. Wisc.).</div>
    </div>
    """
