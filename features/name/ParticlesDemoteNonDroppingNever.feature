Feature: name
  As a CSL cite processor hacker
  I want the test name_ParticlesDemoteNonDroppingNever to pass

  @citation @name
  Scenario: Particles Demote Non Dropping Never
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0"
          demote-non-dropping-particle="never">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <citation>
        <layout delimiter="&#x0A;">
            <names variable="author">
              <name name-as-sort-order="all">
                <name-part name="given" font-style="italic"/>
                <name-part name="family" font-weight="bold"/>
              </name>
            </names>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Familyname","given":"Givenname al"}],"id":"ITEM-1","type":"book"},{"author":[{"family":"Familyname","given":"Givenname dos"}],"id":"ITEM-2","type":"book"},{"author":[{"family":"Familyname","given":"Givenname el"}],"id":"ITEM-3","type":"book"},{"author":[{"family":"Las Familyname","given":"Givenname de"}],"id":"ITEM-4","type":"book"},{"author":[{"family":"Familyname","given":"Givenname lo"}],"id":"ITEM-5","type":"book"},{"author":[{"family":"Familyname","given":"Givenname les"}],"id":"ITEM-6","type":"book"},{"author":[{"family":"Familyname","given":"Givenname il"}],"id":"ITEM-7","type":"book"},{"author":[{"family":"del Familyname","given":"Givenname"}],"id":"ITEM-8","type":"book"},{"author":[{"family":"Familyname","given":"Givenname dela"}],"id":"ITEM-9","type":"book"},{"author":[{"family":"Familyname","given":"Givenname della"}],"id":"ITEM-10","type":"book"},{"author":[{"family":"Familyname","given":"Givenname dello"}],"id":"ITEM-11","type":"book"},{"author":[{"family":"Di Familyname","given":"Givenname"}],"id":"ITEM-12","type":"book"},{"author":[{"family":"Da Familyname","given":"Givenname"}],"id":"ITEM-13","type":"book"},{"author":[{"family":"Do Familyname","given":"Givenname"}],"id":"ITEM-14","type":"book"},{"author":[{"family":"Des Familyname","given":"Givenname"}],"id":"ITEM-15","type":"book"},{"author":[{"family":"Lou Familyname","given":"Givenname"}],"id":"ITEM-16","type":"book"},{"author":[{"family":"Pietro Familyname","given":"Givenname"}],"id":"ITEM-17","type":"book"},{"author":[{"family":"de Familyname","given":"Givenname"}],"id":"ITEM-18","type":"book"},{"author":[{"family":"La Familyname","given":"Givenname de"}],"id":"ITEM-19","type":"book"},{"author":[{"family":"Familyname","given":"Givenname du"}],"id":"ITEM-20","type":"book"},{"author":[{"family":"Familyname","given":"Givenname d'"}],"id":"ITEM-21","type":"book"},{"author":[{"family":"Le Familyname","given":"Givenname"}],"id":"ITEM-22","type":"book"},{"author":[{"family":"La Familyname","given":"Givenname"}],"id":"ITEM-23","type":"book"},{"author":[{"family":"L'Familyname","given":"Givenname"}],"id":"ITEM-24","type":"book"},{"author":[{"family":"Saint Familyname","given":"Givenname"}],"id":"ITEM-25","type":"book"},{"author":[{"family":"Sainte Familyname","given":"Givenname"}],"id":"ITEM-26","type":"book"},{"author":[{"family":"St. Familyname","given":"Givenname"}],"id":"ITEM-27","type":"book"},{"author":[{"family":"Ste. Familyname","given":"Givenname"}],"id":"ITEM-28","type":"book"},{"author":[{"family":"van Familyname","given":"Givenname"}],"id":"ITEM-29","type":"book"},{"author":[{"family":"van de Familyname","given":"Givenname"}],"id":"ITEM-30","type":"book"},{"author":[{"family":"van der Familyname","given":"Givenname"}],"id":"ITEM-31","type":"book"},{"author":[{"family":"van den Familyname","given":"Givenname"}],"id":"ITEM-32","type":"book"},{"author":[{"family":"vander Familyname","given":"Givenname"}],"id":"ITEM-33","type":"book"},{"author":[{"family":"v.d. Familyname","given":"Givenname"}],"id":"ITEM-34","type":"book"},{"author":[{"family":"vd Familyname","given":"Givenname"}],"id":"ITEM-35","type":"book"},{"author":[{"family":"van het Familyname","given":"Givenname"}],"id":"ITEM-36","type":"book"},{"author":[{"family":"ver Familyname","given":"Givenname"}],"id":"ITEM-37","type":"book"},{"author":[{"family":"Familyname","given":"Givenname ten"}],"id":"ITEM-38","type":"book"},{"author":[{"family":"Familyname","given":"Givenname ter"}],"id":"ITEM-39","type":"book"},{"author":[{"family":"Familyname","given":"Givenname te"}],"id":"ITEM-40","type":"book"},{"author":[{"family":"Familyname","given":"Givenname op de"}],"id":"ITEM-41","type":"book"},{"author":[{"family":"Familyname","given":"Givenname in de"}],"id":"ITEM-42","type":"book"},{"author":[{"family":"Familyname","given":"Givenname in 't"}],"id":"ITEM-43","type":"book"},{"author":[{"family":"Familyname","given":"Givenname 't"}],"id":"ITEM-44","type":"book"},{"author":[{"family":"Familyname","given":"Givenname in het"}],"id":"ITEM-45","type":"book"},{"author":[{"family":"Familyname","given":"Givenname uit de"}],"id":"ITEM-46","type":"book"},{"author":[{"family":"Familyname","given":"Givenname uit den"}],"id":"ITEM-47","type":"book"},{"author":[{"family":"Familyname","given":"Givenname von"}],"id":"ITEM-48","type":"book"},{"author":[{"family":"Familyname","given":"Givenname von der"}],"id":"ITEM-49","type":"book"},{"author":[{"family":"Familyname","given":"Givenname von dem"}],"id":"ITEM-50","type":"book"},{"author":[{"family":"Familyname","given":"Givenname von zu"}],"id":"ITEM-51","type":"book"},{"author":[{"family":"Familyname","given":"Givenname v."}],"id":"ITEM-52","type":"book"},{"author":[{"family":"Familyname","given":"Givenname v"}],"id":"ITEM-53","type":"book"},{"author":[{"family":"Familyname","given":"Givenname vom"}],"id":"ITEM-54","type":"book"},{"author":[{"family":"Familyname","given":"Givenname das"}],"id":"ITEM-55","type":"book"},{"author":[{"family":"Familyname","given":"Givenname zum"}],"id":"ITEM-56","type":"book"},{"author":[{"family":"Familyname","given":"Givenname zur"}],"id":"ITEM-57","type":"book"},{"author":[{"family":"Familyname","given":"Givenname den"}],"id":"ITEM-58","type":"book"},{"author":[{"family":"Familyname","given":"Givenname der"}],"id":"ITEM-59","type":"book"},{"author":[{"family":"Familyname","given":"Givenname des"}],"id":"ITEM-60","type":"book"},{"author":[{"family":"Familyname","given":"Givenname auf den"}],"id":"ITEM-61","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    <b>Familyname</b>, <i>Givenname</i> <i>al</i>
    <b>Familyname</b>, <i>Givenname</i> <i>dos</i>
    <b>Familyname</b>, <i>Givenname</i> <i>el</i>
    <b>Las</b> <b>Familyname</b>, <i>Givenname</i> <i>de</i>
    <b>Familyname</b>, <i>Givenname</i> <i>lo</i>
    <b>Familyname</b>, <i>Givenname</i> <i>les</i>
    <b>Familyname</b>, <i>Givenname</i> <i>il</i>
    <b>del</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Familyname</b>, <i>Givenname</i> <i>dela</i>
    <b>Familyname</b>, <i>Givenname</i> <i>della</i>
    <b>Familyname</b>, <i>Givenname</i> <i>dello</i>
    <b>Di</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Da</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Do</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Des</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Lou</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Pietro Familyname</b>, <i>Givenname</i>
    <b>de</b> <b>Familyname</b>, <i>Givenname</i>
    <b>La</b> <b>Familyname</b>, <i>Givenname</i> <i>de</i>
    <b>Familyname</b>, <i>Givenname</i> <i>du</i>
    <b>Familyname</b>, <i>Givenname</i> <i>d’</i>
    <b>Le</b> <b>Familyname</b>, <i>Givenname</i>
    <b>La</b> <b>Familyname</b>, <i>Givenname</i>
    <b>L’Familyname</b>, <i>Givenname</i>
    <b>Saint Familyname</b>, <i>Givenname</i>
    <b>Sainte Familyname</b>, <i>Givenname</i>
    <b>St. Familyname</b>, <i>Givenname</i>
    <b>Ste. Familyname</b>, <i>Givenname</i>
    <b>van</b> <b>Familyname</b>, <i>Givenname</i>
    <b>van de</b> <b>Familyname</b>, <i>Givenname</i>
    <b>van der</b> <b>Familyname</b>, <i>Givenname</i>
    <b>van den</b> <b>Familyname</b>, <i>Givenname</i>
    <b>vander</b> <b>Familyname</b>, <i>Givenname</i>
    <b>v.d. Familyname</b>, <i>Givenname</i>
    <b>vd</b> <b>Familyname</b>, <i>Givenname</i>
    <b>van het</b> <b>Familyname</b>, <i>Givenname</i>
    <b>ver</b> <b>Familyname</b>, <i>Givenname</i>
    <b>Familyname</b>, <i>Givenname</i> <i>ten</i>
    <b>Familyname</b>, <i>Givenname</i> <i>ter</i>
    <b>Familyname</b>, <i>Givenname</i> <i>te</i>
    <b>Familyname</b>, <i>Givenname</i> <i>op de</i>
    <b>Familyname</b>, <i>Givenname</i> <i>in de</i>
    <b>Familyname</b>, <i>Givenname</i> <i>in ’t</i>
    <b>Familyname</b>, <i>Givenname ’t</i>
    <b>Familyname</b>, <i>Givenname</i> <i>in het</i>
    <b>Familyname</b>, <i>Givenname</i> <i>uit de</i>
    <b>Familyname</b>, <i>Givenname</i> <i>uit den</i>
    <b>Familyname</b>, <i>Givenname</i> <i>von</i>
    <b>Familyname</b>, <i>Givenname</i> <i>von der</i>
    <b>Familyname</b>, <i>Givenname</i> <i>von dem</i>
    <b>Familyname</b>, <i>Givenname</i> <i>von zu</i>
    <b>Familyname</b>, <i>Givenname v.</i>
    <b>Familyname</b>, <i>Givenname</i> <i>v</i>
    <b>Familyname</b>, <i>Givenname</i> <i>vom</i>
    <b>Familyname</b>, <i>Givenname</i> <i>das</i>
    <b>Familyname</b>, <i>Givenname</i> <i>zum</i>
    <b>Familyname</b>, <i>Givenname</i> <i>zur</i>
    <b>Familyname</b>, <i>Givenname</i> <i>den</i>
    <b>Familyname</b>, <i>Givenname</i> <i>der</i>
    <b>Familyname</b>, <i>Givenname</i> <i>des</i>
    <b>Familyname</b>, <i>Givenname</i> <i>auf den</i>
    """
