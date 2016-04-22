Feature: date
  As a CSL cite processor hacker
  I want the test date_DayOrdinalDayOneOnly to pass

  @citation @date
  Scenario: Day Ordinal Day One Only
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
        <style-options limit-day-ordinals-to-day-1="true"/>
        <date form="text">
          <date-part name="day" suffix=" " form="ordinal"/>
          <date-part name="month" suffix=" "/>
          <date-part name="year"/>
        </date>
      </locale>
      <citation>
        <layout delimiter="; ">
          <group delimiter=" ">
            <text variable="title"/>
            <date variable="issued" prefix="(" suffix=")" form="text" date-parts="year-month-day"/>
          </group>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","issued":{"date-parts":[["1965","6","1"]]},"title":"Day One","type":"book"},{"id":"ITEM-2","issued":{"date-parts":[["1965","6","2"]]},"title":"Day Two","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Day One (1st June 1965); Day Two (2 June 1965)
    """
