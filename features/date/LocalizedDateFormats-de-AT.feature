Feature: date
  As a CSL cite processor hacker
  I want the test date_LocalizedDateFormats-de-AT to pass

  @citation @date
  Scenario: Localized Date Formats-de-AT
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
      <locale>
        <date form="text">
          <date-part name="day" suffix=" "/>
          <date-part name="month" suffix=" "/>
          <date-part name="year"/>
        </date>
        <date form="numeric">
          <date-part name="day" form="numeric-leading-zeros" suffix="/"/>
          <date-part name="month" form="numeric-leading-zeros" suffix="/"/>
          <date-part name="year"/>
        </date>
      </locale>
      <citation>
        <layout>
          <group delimiter="&#x0A;">
            <date variable="issued" form="text" date-parts="year-month-day"/>
            <date variable="issued" form="text" date-parts="year-month"/>
            <date variable="issued" form="text" date-parts="year"/>
            <date variable="issued" form="numeric" date-parts="year-month-day"/>
            <date variable="issued" form="numeric" date-parts="year-month"/>
            <date variable="issued" form="numeric" date-parts="year"/>
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[[1998,4,10]]},"title":"BookA"}]
    """
    When I cite all items
    Then the result should be:
    """
    10 April 1998
    April 1998
    1998
    10/04/1998
    04/1998
    1998
    """
