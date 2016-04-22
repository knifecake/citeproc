Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_GreekStyleTwoEditors to pass

  @citation @bugreports
  Scenario: Greek Style Two Editors
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="note" default-locale="el" version="1.0">
      <info>
        <title>Greek (Full Note with Bibliography) g2</title>
        <id>http://www.zotero.org/styles/gr2</id>
        <link href="http://www.zotero.org/styles/gr2" rel="self"/>
        <author>
          <name>A.D.</name>
        </author>
        <summary>Greek based on Chicago format with full notes and bibliography</summary>
        <category field="generic-base"/>
        <category citation-format="note"/>
        <updated>2010-11-04T20:22:16+00:00</updated>
      </info>
      <locale xml:lang="el">
        <terms>
          <term name="accessed">ημερομηνία πρόσβασης</term>
          <term name="and">και</term>
          <term name="and others">και άλλοι</term>
          <term name="anonymous">ανώνυμο</term>
          <term name="anonymous" form="short">ανών</term>
          <term name="at">εφ</term>
          <term name="by">του</term>
          <term name="circa">περίπου</term>
          <term name="circa" form="short">περ</term>
          <term name="cited">παρατίθεται</term>
          <term name="edition">
            <single>έκδοση</single>
            <multiple>εκδόσεις</multiple>
          </term>
          <term name="edition" form="short">έκδ</term>
          <term name="et-al">κ.ά.</term>
          <term name="forthcoming">προσεχές</term>
          <term name="from">από</term>
          <term name="ibid">Στο ίδιο</term>
          <term name="in">στο</term>
          <term name="in press">υπό έκδοση</term>
          <term name="internet">διαδίκτυο</term>
          <term name="interview">συνέντευξη</term>
          <term name="letter">επιστολή</term>
          <term name="no date">χωρίς χρονολογία</term>
          <term name="no date" form="short">χ.χ.</term>
          <term name="online">έκδοση σε ψηφιακή μορφή</term>
          <term name="presented at">παρουσιάστηκε στο</term>
          <term name="reference">
            <single>αναφορά</single>
            <multiple>αναφορές</multiple>
          </term>
          <term name="reference" form="short">
            <single>αναφ</single>
            <multiple>αναφ</multiple>
          </term>
          <term name="retrieved">ανακτήθηκε</term>
          <term name="ad">μ.Χ.</term>
          <term name="bc">π.Χ.</term>
          <term name="open-quote"/>
          <term name="close-quote"/>
          <term name="open-inner-quote"/>
          <term name="close-inner-quote"/>
          <term name="ordinal-01">ος</term>
          <term name="ordinal-02">ος</term>
          <term name="ordinal-03">ος</term>
          <term name="ordinal-04">ος</term>
        <term name="long-ordinal-01">πρώτος</term>
          <term name="long-ordinal-02">δεύτερος</term>
          <term name="long-ordinal-03">τρίτος</term>
          <term name="long-ordinal-04">τέταρτος</term>
          <term name="long-ordinal-05">πέμπτος</term>
          <term name="long-ordinal-06">έκτος</term>
          <term name="long-ordinal-07">έβδομος</term>
          <term name="long-ordinal-08">όγδοος</term>
          <term name="long-ordinal-09">ένατος</term>
          <term name="long-ordinal-10">δέκατος</term>
           <term name="anthropology">ανθρωπολογία</term>
        <term name="astronomy">αστρονομία</term>
        <term name="biology">βιολογία</term>
        <term name="botany">βοτανική</term>
        <term name="chemistry">χημεία</term>
        <term name="engineering">μηχανική</term>
        <term name="generic-base">γενική βάση</term>
        <term name="geography">γεωγραφία</term>
        <term name="geology">γεωλογία</term>
        <term name="history">ιστορία</term>
        <term name="humanities">ανθρωπιστικές σπουδές</term>
        <term name="literature">λογοτεχνία</term>
        <term name="math">μαθηματικά</term>
        <term name="medicine">ιατρική</term>
        <term name="philosophy">φιλοσοφία</term>
        <term name="physics">φυσική</term>
        <term name="psychology">ψυχολογία</term>
        <term name="sociology">κοινωνιολογία</term>
        <term name="science">θετικές επιστήμες</term>
        <term name="political_science">πολιτικές επιστήμες</term>
        <term name="social_science">κοινωνικές επιστήμες</term>
        <term name="theology">θεολογία</term>
        <term name="zoology">ζωολογία</term>
           <term name="book">
             <single>βιβλίο</single>
             <multiple>βιβλίο</multiple>
          </term>
          <term name="chapter">
             <single>κεφάλαιο</single>
             <multiple>κεφάλαια</multiple>
          </term>
          <term name="column">
             <single>στήλη</single>
             <multiple>στήλες</multiple>
          </term>
          <term name="figure">
             <single>εικόνα</single>
             <multiple>εικόνες</multiple>
          </term>
          <term name="folio">
             <single>φάκελος</single>
             <multiple>φάκελοι</multiple>
          </term>
          <term name="issue">
             <single>τεύχος</single>
             <multiple>τεύχη</multiple>
          </term>
          <term name="line">
             <single>σειρά</single>
             <multiple>σειρές</multiple>
          </term>
          <term name="note">
             <single>σημείωση</single>
             <multiple>σημειώσεις</multiple>
          </term>
          <term name="opus">
             <single>έργο</single>
             <multiple>έργα</multiple>
          </term>
          <term name="page">
             <single>σελίδα</single>
             <multiple>σελίδες</multiple>
          </term>
          <term name="paragraph">
             <single>παράγραφος</single>
             <multiple>παράγραφοι</multiple>
          </term>
          <term name="part">
             <single>μέρος</single>
             <multiple>μέρη</multiple>
          </term>
          <term name="section">
             <single>τμήμα</single>
             <multiple>τμήματα</multiple>
          </term>
          <term name="sub verbo">
             <single>λήμμα</single>
             <multiple>λήμματα</multiple>
          </term>
          <term name="verse">
             <single>στίχος</single>
             <multiple>στίχοι</multiple>
          </term>
          <term name="volume">
             <single>τόμος</single>
             <multiple>τόμοι</multiple>
          </term>
       <term name="book" form="short">βιβ</term>
          <term name="chapter" form="short">κεφ</term>
          <term name="column" form="short">στ</term>
          <term name="figure" form="short">εικ</term>
          <term name="folio" form="short">φακ</term>
          <term name="issue" form="short">τχ</term>
          <term name="opus" form="short">έργ</term>
          <term name="page" form="short">
             <single>σ</single>
             <multiple>σσ</multiple>
          </term>
         <term name="paragraph" form="short">παρ</term>
          <term name="part" form="short">μερ</term>
          <term name="section" form="short">τμ</term>
          <term name="sub verbo" form="short">
             <single>λήμ</single>
             <multiple>λήμ</multiple>
          </term>
          <term name="verse" form="short">
             <single>στ</single>
             <multiple>στ</multiple>
          </term>
          <term name="volume" form="short">
             <single>τμ</single>
             <multiple>τμ</multiple>
          </term>
          <term name="paragraph" form="symbol">
            <single>ΒΆ</single>
            <multiple>ΒΆΒΆ</multiple>
          </term>
          <term name="section" form="symbol">
            <single/>
            <multiple/>
          </term>
          <term name="author">
            <single/>
            <multiple/>
          </term>
          <term name="editor">
             <single>επιμελητής</single>
             <multiple>επιμελητές</multiple>
          </term>
          <term name="editorial-director">
             <single>γενική εποπτεία</single>
             <multiple>γενική εποπτεία</multiple>
          </term>
          <term name="translator">
             <single>μεταφραστής</single>
             <multiple>μεταφραστές</multiple>
          </term>
          <term name="editortranslator">
             <single>μετάφραση και επιμέλεια</single>
             <multiple>μετάφραση και επιμέλεια</multiple>
          </term>
          <term name="author" form="short">
            <single/>
            <multiple/>
          </term>
           <term name="editor" form="short">
             <single>επιμ</single>
             <multiple>επιμ</multiple>
          </term>
          <term name="editorial-director" form="short">
             <single>γεν. επ</single>
             <multiple>γεν. επ</multiple>
          </term>
          <term name="translator" form="short">
             <single>μτφ</single>
             <multiple>μτφ</multiple>
          </term>
          <term name="editortranslator" form="short">
             <single>μτφ. και επιμ</single>
             <multiple>μτφ. και επιμ</multiple>
          </term>
          <term name="editor" form="verb">επιμ</term>
          <term name="editorial-director" form="verb">γεν επ</term>
          <term name="translator" form="verb">μτφ</term>
          <term name="editortranslator" form="verb">μτφ. και επιμ</term>
          <term name="recipient" form="verb">στο</term>
          <term name="interviewer" form="verb">συνέντευξη</term>
          <term name="container-author" form="verb-short"></term>
          <term name="editor" form="verb-short">επιμ</term>
          <term name="editorial-director" form="verb-short">γεν. επ</term>
          <term name="translator" form="verb-short">μτφ</term>
          <term name="editortranslator" form="verb-short">μτφ. και επιμ</term>
        <term name="month-01">Ιανουάριος</term>
        <term name="month-02">Φεβρουάριος</term>
        <term name="month-03">Μάρτιος</term>
        <term name="month-04">Απρίλιος</term>
        <term name="month-05">Μάιος</term>
        <term name="month-06">Ιούνιος</term>
        <term name="month-07">Ιούλιος</term>
        <term name="month-08">Αύγουστος</term>
        <term name="month-09">Σεπτέμβριος</term>
        <term name="month-10">Οκτώβριος</term>
        <term name="month-11">Νοέμβριος</term>
        <term name="month-12">Δεκέμβριος</term>
        <term name="month-01" form="short">Ιανουαρίου</term>
        <term name="month-02" form="short">Φεβρουαρίου</term>
        <term name="month-03" form="short">Μαρτίου</term>
        <term name="month-04" form="short">Απριλίου</term>
        <term name="month-05" form="short">Μαΐου</term>
        <term name="month-06" form="short">Ιουνίου</term>
        <term name="month-07" form="short">Ιουλίου</term>
        <term name="month-08" form="short">Αυγούστου</term>
        <term name="month-09" form="short">Σεπτεμβρίου</term>
        <term name="month-10" form="short">Οκτωβρίου</term>
        <term name="month-11" form="short">Νοεμβρίου</term>
        <term name="month-12" form="short">Δεκεμβρίου</term>
          <term name="season-01">Άνοιξη</term>
          <term name="season-02">Καλοκαίρι</term>
          <term name="season-03">Φθινόπωρο</term>
          <term name="season-04">Χειμώνας</term>
        </terms>
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
      <macro name="editor-translator">
        <group delimiter=", ">
          <choose>
            <if variable="container-author" match="any">
              <names variable="translator" delimiter=", ">
                <label form="verb-short" text-case="lowercase" suffix=". " strip-periods="true"/>
                <name and="text" delimiter=", "/>
              </names>
            </if>
            <else-if variable="author">
              <names variable="translator" delimiter=", ">
                <label form="verb-short" text-case="lowercase" suffix=". " strip-periods="true"/>
                <name and="text" delimiter=", "/>
              </names>
            </else-if>
          </choose>
          <choose>
            <if variable="container-author" match="none"/>
            <else-if variable="author" match="any">
              <names variable="editor" delimiter=", ">
                <label form="verb-short" text-case="lowercase" suffix=". " strip-periods="true"/>
                <name and="text" delimiter=", "/>
              </names>
            </else-if>
          </choose>
        </group>
      </macro>
      <macro name="secondary-contributors-note">
        <choose>
          <if type="chapter paper-conference" match="none">
            <group delimiter=", ">
              <choose>
                <if variable="author">
                  <names variable="translator" delimiter=". ">
                    <label form="verb" text-case="lowercase" suffix=" "/>
                    <name and="text" delimiter=", "/>
                  </names>
                </if>
              </choose>
              <choose>
                <if variable="author translator" match="any">
                  <names variable="editor" delimiter=". ">
                    <label form="verb-short" text-case="lowercase" suffix=". " strip-periods="true"/>
                    <name and="text" delimiter=", "/>
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="container-contributors-note">
        <choose>
          <if type="chapter paper-conference" match="any">
            <text macro="editor-translator"/>
          </if>
        </choose>
      </macro>
      <macro name="secondary-contributors">
        <choose>
          <if type="chapter paper-conference" match="none">
            <group delimiter=", ">
              <choose>
                <if variable="author">
                  <names variable="translator" delimiter=". ">
                    <label form="verb" text-case="lowercase" suffix=" "/>
                    <name and="text" delimiter=", "/>
                  </names>
                </if>
              </choose>
              <choose>
                <if variable="author translator" match="any">
                  <names variable="editor" delimiter=". ">
                    <label form="verb-short" text-case="lowercase" suffix=". " strip-periods="true"/>
                    <name and="text" delimiter=", "/>
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="container-contributors">
        <choose>
          <if type="chapter paper-conference" match="any">
            <text macro="editor-translator"/>
          </if>
        </choose>
      </macro>
      <macro name="editor-note">
        <names variable="editor">
          <name and="text" sort-separator=", " delimiter=", "/>
          <label form="verb-short" prefix=" (" suffix=".)" strip-periods="true"/>
        </names>
      </macro>
      <macro name="translator-note">
        <names variable="translator">
          <name and="text" sort-separator=", " delimiter=", "/>
          <label form="verb-short" prefix=", " suffix="." strip-periods="true"/>
        </names>
      </macro>
      <macro name="recipient-note">
        <names variable="recipient" delimiter=", ">
          <label form="verb" prefix=" " text-case="lowercase" suffix=" "/>
          <name and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="contributors-note">
        <names variable="author">
          <name and="text" sort-separator=", " delimiter=", "/>
          <substitute>
            <text macro="editor-note"/>
            <text macro="translator-note"/>
          </substitute>
        </names>
        <text macro="recipient-note"/>
      </macro>
      <macro name="editor">
        <names variable="editor">
          <name name-as-sort-order="first" and="text" sort-separator=" " delimiter=", " delimiter-precedes-last="never"/>
          <label form="verb-short" prefix=" (" suffix=".)" strip-periods="true"/>
        </names>
      </macro>
      <macro name="translator">
        <names variable="translator">
          <name name-as-sort-order="first" and="text" sort-separator=", " delimiter=", " delimiter-precedes-last="never"/>
          <label form="verb-short" prefix=", " suffix="." strip-periods="true"/>
        </names>
      </macro>
      <macro name="recipient">
        <choose>
          <if type="personal_communication">
            <choose>
              <if variable="genre">
                <text variable="genre" text-case="lowercase"/>
              </if>
              <else>
                <text term="letter" text-case="lowercase"/>
              </else>
            </choose>
          </if>
        </choose>
        <text macro="recipient-note" prefix=" "/>
      </macro>
      <macro name="contributors">
        <names variable="author">
          <name name-as-sort-order="first" and="text" sort-separator=" " delimiter=", " delimiter-precedes-last="never"/>
          <substitute>
            <text macro="editor"/>
            <text macro="translator"/>
          </substitute>
        </names>
        <text macro="recipient" prefix=". "/>
      </macro>
      <macro name="recipient-short">
        <names variable="recipient">
          <label form="verb" prefix=" " text-case="lowercase" suffix=" "/>
          <name form="short" and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="contributors-short">
        <names variable="author">
          <name form="short" and="text" delimiter=", "/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
          </substitute>
        </names>
        <text macro="recipient-short"/>
      </macro>
      <macro name="contributors-sort">
        <names variable="author">
          <name name-as-sort-order="all" and="text" sort-separator=", " delimiter=", " delimiter-precedes-last="never"/>
          <label form="verb-short" prefix=", " suffix="." strip-periods="true"/>
          <substitute>
            <names variable="editor"/>
            <names variable="translator"/>
          </substitute>
        </names>
      </macro>
      <macro name="interviewer-note">
        <names variable="interviewer" delimiter=", ">
          <label form="verb" prefix=" " text-case="lowercase" suffix=" "/>
          <name and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="interviewer">
        <names variable="interviewer" delimiter=", ">
          <label form="verb" prefix=" " text-case="lowercase" suffix=" "/>
          <name and="text" delimiter=", "/>
        </names>
      </macro>
      <macro name="title-note">
        <choose>
          <if variable="title" match="none">
            <text variable="genre"/>
          </if>
          <else-if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" font-style="italic"/>
          </else-if>
          <else-if type="entry-encyclopedia">
            <choose>
              <if variable="author">
                 <text variable="title"  prefix="«" suffix="»"/>
    <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </if>
              <else>
                <text variable="title" prefix="«" suffix="»"/>
                <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </else>
            </choose>
          </else-if>
          <else-if type="entry-dictionary">
            <choose>
              <if variable="author">
           <text variable="title"  prefix="«" suffix="»"/>
    <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </if>
              <else>
                <text variable="title" prefix="«" suffix="»"/>
                <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </else>
            </choose>
          </else-if>
          <else>
            <text variable="title" prefix="«" suffix="»"/>
          </else>
        </choose>
      </macro>
      <macro name="title">
        <choose>
          <if variable="title" match="none">
            <choose>
              <if type="personal_communication" match="none">
                <text variable="genre" text-case="lowercase"/>
              </if>
            </choose>
          </if>
          <else-if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" font-style="italic"/>
          </else-if>
          <else-if type="entry-encyclopedia">
            <choose>
              <if variable="author">
                   <text variable="title"  prefix="«" suffix="»"/>
    <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </if>
              <else>
                <text variable="title" prefix="«" suffix="»"/>
                <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </else>
            </choose>
          </else-if>
          <else-if type="entry-dictionary">
            <choose>
              <if variable="author">
               <text variable="title"  prefix="«" suffix="»"/>
    <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </if>
              <else>
                <text variable="title" prefix="«" suffix="»"/>
                <text term="sub verbo" text-case="lowercase" prefix=" (" suffix=")"/>
              </else>
            </choose>
          </else-if>
          <else>
            <text variable="title" prefix="«" suffix="»"/>
          </else>
        </choose>
      </macro>
      <macro name="title-short">
        <choose>
          <if variable="title" match="none">
            <choose>
              <if type="interview">
                <text term="interview" text-case="lowercase"/>
              </if>
              <else-if type="manuscript speech" match="any">
                <text variable="genre" form="short"/>
              </else-if>
              <else-if type="personal_communication">
                <text macro="issued"/>
              </else-if>
            </choose>
          </if>
          <else-if type="bill book graphic legal_case motion_picture report song" match="any">
            <text variable="title" form="short" font-style="italic"/>
          </else-if>
          <else>
            <text variable="title" form="short" prefix="" suffix=""/>
          </else>
        </choose>
      </macro>
      <macro name="description-note">
        <group delimiter=", ">
          <text macro="interviewer-note"/>
          <text variable="medium"/>
          <choose>
            <if variable="title" match="none"/>
            <else-if type="thesis speech" match="any"/>
            <else>
              <text variable="genre"/>
            </else>
          </choose>
        </group>
      </macro>
      <macro name="description">
        <group delimiter=", ">
          <group delimiter=". ">
            <text macro="interviewer"/>
            <text variable="medium" text-case="lowercase"/>
          </group>
          <choose>
            <if variable="title" match="none"/>
            <else-if type="thesis speech" match="any"/>
            <else>
              <text variable="genre" text-case="lowercase"/>
            </else>
          </choose>
        </group>
      </macro>
      <macro name="container-title-note">
        <choose>
          <if type="article-newspaper">
            <text term="at" text-case="lowercase" suffix=". "/>
          </if>
        </choose>
        <choose>
          <if variable="container-author">
            <text term="in" text-case="lowercase" suffix=": "/>
            <group suffix=", ">
              <names variable="container-author">
                <label form="verb-short" prefix=" " text-case="lowercase" suffix=" " strip-periods="true"/>
                <name and="text" delimiter=", "/>
              </names>
            </group>
          </if>
        <else-if type="entry-encyclopedia" match="any">
          </else-if>
            <else-if type="entry-dictionary" match="any">
          </else-if>
          <else-if type="chapter paper-conference" match="any">
            <text term="in" suffix=": "/>
            <names variable="editor" delimiter=", " suffix=", ">
              <name and="text" delimiter=", "/>
              <label form="short" prefix=" (" suffix=".)" strip-periods="true"/>
            </names>
          </else-if>
        </choose>
        <choose>
          <if type="legal_case" match="none">
            <text variable="container-title" font-style="italic"/>
          </if>
        </choose>
      </macro>
      <macro name="container-title">
        <choose>
          <if type="article-newspaper">
            <text term="at" text-case="lowercase" suffix=". "/>
          </if>
        </choose>
        <choose>
          <if variable="container-author">
            <text term="in" text-case="lowercase" suffix=": "/>
            <group suffix=", ">
              <names variable="container-author">
                <label form="verb-short" prefix=" " text-case="lowercase" suffix=" " strip-periods="true"/>
                <name and="text" delimiter=", "/>
              </names>
            </group>
          </if>
        <else-if type="entry-encyclopedia" match="any">
          </else-if>
            <else-if type="entry-dictionary" match="any">
          </else-if>
          <else-if type="chapter paper-conference" match="any">
            <text term="in" suffix=": "/>
            <names variable="editor" delimiter=", " suffix=", ">
              <name and="text" delimiter=", "/>
              <label form="short" prefix=" (" suffix=".)" strip-periods="true"/>
            </names>
          </else-if>
        </choose>
        <choose>
          <if type="legal_case" match="none">
            <text variable="container-title" font-style="italic"/>
          </if>
        </choose>
      </macro>
      <macro name="collection-title">
        <text variable="collection-title"/>
        <text variable="collection-number" prefix=" "/>
      </macro>
      <macro name="edition-note">
        <choose>
          <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <text variable="edition"/>
                  <text term="edition" form="short" suffix="." strip-periods="true"/>
                </group>
              </if>
              <else>
                <text variable="edition" suffix="."/>
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="edition">
        <choose>
          <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <text variable="edition"/>
                  <text term="edition" form="short" suffix="." strip-periods="true"/>
                </group>
              </if>
              <else>
                <text variable="edition" text-case="lowercase" suffix="."/>
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="locators-note">
        <choose>
          <if type="article-journal">
            <group prefix=", ">
              <text term="volume" form="short" suffix=". " strip-periods="true"/>
              <text variable="volume" prefix=""/>
            </group>
            <group prefix=", ">
              <text term="issue" form="short" suffix=". " strip-periods="true"/>
              <text variable="issue"/>
            </group>
          </if>
        </choose>
        <choose>
          <if type="article-magazine">
            <group prefix=", ">
              <text term="volume" form="short" suffix=". " strip-periods="true"/>
              <text variable="volume" prefix=""/>
            </group>
            <group prefix=", ">
              <text term="issue" form="short" suffix=". " strip-periods="true"/>
              <text variable="issue"/>
            </group>
          </if>
        </choose>
        <choose>
          <if type="legal_case">
            <text variable="volume" prefix=", "/>
            <text variable="container-title" prefix=" "/>
            <text macro="pages"/>
            <text variable="locator" prefix=", "/>
          </if>
        </choose>
        <choose>
          <if type="bill book graphic legal_case motion_picture report song chapter paper-conference" match="any">
            <group prefix=", " delimiter=", ">
              <group>
                <text term="volume" form="short" suffix=". " strip-periods="true"/>
                <text variable="volume"/>
              </group>
              <group>
                <text variable="number-of-volumes"/>
                <text term="volume" form="verb-short" prefix=" " suffix="" strip-periods="true"/>
              </group>
              <text macro="edition-note"/>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="locators">
        <choose>
          <if type="article-journal">
            <group prefix=", ">
              <text term="volume" form="short" suffix=". " strip-periods="true"/>
              <text variable="volume" prefix=""/>
            </group>
            <group prefix=", ">
              <text term="issue" form="short" suffix=". " strip-periods="true"/>
              <text variable="issue"/>
            </group>
          </if>
        </choose>
        <choose>
          <if type="article-magazine">
            <group prefix=", ">
              <text term="volume" form="short" suffix=". " strip-periods="true"/>
              <text variable="volume" prefix=""/>
            </group>
            <group prefix=", ">
              <text term="issue" form="short" suffix=". " strip-periods="true"/>
              <text variable="issue"/>
            </group>
          </if>
          <else-if type="legal_case">
            <text variable="volume" prefix=", "/>
            <text variable="container-title" prefix=" "/>
            <text macro="pages"/>
          </else-if>
          <else-if type="bill book graphic legal_case motion_picture report song" match="any">
            <group prefix=", " delimiter=", ">
              <group>
                <text term="volume" form="short" text-case="lowercase" suffix=". " strip-periods="true"/>
                <text variable="volume"/>
              </group>
              <group>
                <text variable="number-of-volumes"/>
                <text term="volume" form="verb-short" prefix=" " suffix="" strip-periods="true"/>
              </group>
              <text macro="edition"/>
            </group>
          </else-if>
          <else-if type="chapter paper-conference" match="any">
            <group prefix=", " delimiter=", ">
              <group>
                <text term="volume" form="short" suffix=". " strip-periods="true"/>
                <text variable="volume"/>
              </group>
              <group>
                <text variable="number-of-volumes"/>
                <text term="volume" form="verb-short" prefix=" " suffix="" strip-periods="true"/>
              </group>
              <text macro="edition-note"/>
            </group>
          </else-if>
        </choose>
      </macro>
      <macro name="locators-newspaper">
        <choose>
          <if type="article-newspaper">
            <group delimiter=", ">
              <group>
                <text variable="edition" suffix=" "/>
                <text term="edition" prefix=" "/>
              </group>
              <group>
                <text term="section" form="short" suffix=". " strip-periods="true"/>
                <text variable="section"/>
              </group>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="event">
        <group>
          <text term="presented at" suffix=" "/>
          <text variable="event"/>
        </group>
      </macro>
      <macro name="publisher">
        <group prefix=", " delimiter=", ">
          <text variable="publisher"/>
          <text variable="publisher-place"/>
        </group>
      </macro>
      <macro name="issued">
        <choose>
          <if variable="issued">
            <choose>
              <if type="article-journal" match="any">
                <group prefix="(" suffix=")">
                  <date variable="issued">
                    <date-part name="day" suffix=" "/>
                    <date-part name="month" suffix=" "/>
                    <date-part name="year"/>
                  </date>
                </group>
              </if>
              <else-if type="graphic report" match="any">
                <date variable="issued">
                  <date-part name="day" suffix=" "/>
                  <date-part name="month" form="short" suffix=" " strip-periods="true"/>
                  <date-part name="year"/>
                </date>
              </else-if>
              <else-if type="legal_case">
                <text variable="authority" suffix=" "/>
                <date variable="issued">
                  <date-part name="year"/>
                </date>
              </else-if>
              <else-if type="bill book graphic legal_case motion_picture report song thesis chapter paper-conference" match="any">
                <date variable="issued">
                  <date-part name="year"/>
                </date>
              </else-if>
              <else>
                <date variable="issued">
                  <date-part name="day" suffix=" "/>
                  <date-part name="month" form="short" suffix=" " strip-periods="true"/>
                  <date-part name="year"/>
                </date>
              </else>
            </choose>
          </if>
          <else>
            <text term="no date"/>
          </else>
        </choose>
      </macro>
      <macro name="point-locators-subsequent">
        <group>
          <choose>
            <if locator="page" match="all">
              <choose>
                <if type="bill book graphic legal_case motion_picture report song" match="any">
                  <choose>
                    <if variable="volume">
                      <group>
                        <text term="volume" form="short" text-case="lowercase" suffix=". " strip-periods="true"/>
                        <text variable="volume" suffix=", "/>
                      </group>
                    </if>
                  </choose>
                </if>
              </choose>
            </if>
            <else-if type="bill book graphic legal_case motion_picture report song" match="any">
              <group>
                <text term="volume" form="short" text-case="lowercase" suffix=". " strip-periods="true"/>
                <text variable="volume" suffix="."/>
              </group>
            </else-if>
          </choose>
    	  <group>
    		<label variable="locator" form="short" suffix=" "/>
    		<text variable="locator"/>
    	  </group>
        </group>
      </macro>
      <macro name="point-locators">
        <choose>
          <if variable="locator" match="none">
            <text macro="pages"/>
          </if>
          <else-if type="article-journal">
            <text variable="locator" prefix=": "/>
          </else-if>
          <else-if type="legal_case"/>
          <else>
            <group prefix=", ">
              <choose>
                <if locator="page" match="all">
                  <label variable="locator" form="short" suffix=" "/>
                </if>
              </choose>
              <text variable="locator"/>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="pages">
        <label variable="page" form="short" prefix=", " suffix=" "/>
        <text variable="page"/>
      </macro>
      <macro name="locators-chapter">
        <choose>
          <if type="chapter paper-conference" match="any">
            <choose>
              <if variable="page">
                <text macro="pages"/>
              </if>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="locators-journal">
        <choose>
          <if type="article-journal">
            <text macro="pages"/>
          </if>
        </choose>
        <choose>
          <if type="article-newspaper">
            <text macro="pages"/>
          </if>
        </choose>
        <choose>
          <if type="article-magazine">
            <text macro="pages"/>
          </if>
        </choose>
      </macro>
      <macro name="archive-note">
        <group delimiter=", ">
          <text variable="archive_location"/>
          <text variable="archive"/>
          <text variable="archive-place"/>
        </group>
      </macro>
      <macro name="archive">
        <group delimiter=". ">
          <text variable="archive_location" text-case="lowercase"/>
          <text variable="archive"/>
          <text variable="archive-place"/>
        </group>
      </macro>
      <macro name="issue-note">
        <choose>
          <if type="article-journal legal_case" match="any">
            <text macro="issued" prefix=" " suffix=""/>
          </if>
        </choose>
        <choose>
          <if type="article-newspaper" match="any">
            <text variable="publisher-place" prefix=" " suffix=""/>
            <text macro="issued" prefix=", " suffix=""/>
          </if>
          <else-if variable="publisher-place publisher" match="any">
            <group prefix="" suffix="" delimiter="">
              <group delimiter=" ">
                <choose>
                  <if variable="title" match="none"/>
                  <else-if type="thesis speech" match="any">
                    <text variable="genre" prefix=", "/>
                  </else-if>
                </choose>
                <text macro="event"/>
              </group>
              <text macro="publisher"/>
              <text macro="issued" prefix=" " suffix=""/>
            </group>
          </else-if>
          <else>
            <text macro="issued" prefix=", "/>
          </else>
        </choose>
      </macro>
      <macro name="issue">
        <choose>
          <if type="article-journal legal_case" match="any">
            <text macro="issued" prefix=" " suffix=""/>
          </if>
        </choose>
        <choose>
          <if type="article-newspaper" match="any">
            <text variable="publisher-place" prefix=" " suffix=""/>
            <text macro="issued" prefix=", " suffix=""/>
          </if>
          <else-if type="speech">
            <choose>
              <if variable="title" match="none"/>
              <else>
                <text variable="genre" text-case="lowercase" prefix=". "/>
              </else>
            </choose>
            <text macro="event" prefix=" "/>
            <text variable="event-place" prefix=", "/>
            <text macro="issued" prefix=", "/>
          </else-if>
          <else-if variable="publisher-place publisher" match="any">
            <group prefix="" delimiter="">
              <choose>
                <if type="thesis">
                  <text variable="genre" prefix=", "/>
                </if>
              </choose>
              <text macro="publisher" suffix=" "/>
              <text macro="issued" suffix=""/>
            </group>
          </else-if>
          <else>
            <text macro="issued" prefix=", "/>
          </else>
        </choose>
      </macro>
      <macro name="access-note">
        <group delimiter=", ">
          <choose>
            <if type="graphic report" match="any">
              <text macro="archive-note" prefix=", "/>
            </if>
            <else-if type="bill book graphic legal_case motion_picture report song article-journal article-magazine article-newspaper thesis chapter paper-conference" match="none">
              <text macro="archive-note" prefix=", "/>
            </else-if>
          </choose>
        </group>
        <choose>
          <if variable="DOI">
            <text variable="DOI" prefix=" &lt;doi:" suffix="&gt;"/>
          </if>
          <else>
            <group prefix=" [" suffix="]">
              <text term="online"/>
              <text variable="URL" prefix=": "/>
              <date variable="accessed">
                <date-part name="day" prefix=" ("/>
                <date-part name="month" form="numeric" prefix="/"/>
                <date-part name="year" prefix="/" suffix=")"/>
              </date>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="access">
        <group delimiter=", ">
          <choose>
            <if type="graphic report" match="any">
              <text macro="archive-note" prefix=", "/>
            </if>
            <else-if type="bill book graphic legal_case motion_picture report song article-journal article-magazine article-newspaper thesis chapter paper-conference" match="none">
              <text macro="archive-note" prefix=", "/>
            </else-if>
          </choose>
        </group>
        <choose>
          <if variable="DOI">
            <text variable="DOI" prefix=" &lt;doi:" suffix="&gt;"/>
          </if>
          <else>
            <group prefix=" [" suffix="]">
              <text term="online"/>
              <text variable="URL" prefix=": "/>
              <date variable="accessed">
                <date-part name="day" prefix=" ("/>
                <date-part name="month" form="numeric" prefix="/"/>
                <date-part name="year" prefix="/" suffix=")"/>
              </date>
            </group>
          </else>
        </choose>
      </macro>
      <macro name="sort-key">
        <text macro="contributors-sort" suffix=" "/>
        <text variable="title" suffix=" "/>
        <text variable="genre"/>
      </macro>
      <citation et-al-min="4" et-al-use-first="1" et-al-subsequent-min="4" et-al-subsequent-use-first="1" disambiguate-add-names="true">
        <layout prefix="" suffix="." delimiter=". ">
          <choose>
            <if position="ibid-with-locator">
              <group delimiter=", ">
                <text term="ibid"/>
                <text macro="point-locators-subsequent"/>
              </group>
            </if>
            <else-if position="ibid">
              <text term="ibid"/>
            </else-if>
            <else-if position="subsequent">
              <group delimiter=", ">
                <text macro="contributors-short"/>
                <text macro="title-short"/>
                <text macro="point-locators-subsequent"/>
              </group>
            </else-if>
            <else>
              <group delimiter=", ">
                <text macro="contributors-note"/>
                <text macro="title-note"/>
                <text macro="description-note"/>
                <text macro="secondary-contributors-note"/>
                <text macro="container-title-note"/>
                <text macro="container-contributors-note"/>
              </group>
              <text macro="locators-note"/>
              <text macro="collection-title" prefix=", "/>
              <text macro="issue-note"/>
              <text macro="locators-newspaper" prefix=", "/>
              <text macro="point-locators"/>
              <text macro="access-note"/>
            </else>
          </choose>
        </layout>
      </citation>
      <bibliography hanging-indent="true" et-al-min="11" et-al-use-first="7" subsequent-author-substitute="β��β��β��" entry-spacing="0">
        <sort>
          <key macro="sort-key"/>
          <key variable="issued"/>
        </sort>
        <layout suffix=".">
          <group delimiter=", ">
            <text macro="contributors"/>
            <text macro="title"/>
            <text macro="description"/>
            <text macro="secondary-contributors"/>
            <group delimiter=", ">
              <text macro="container-title"/>
              <text macro="container-contributors"/>
            </group>
          </group>
          <text macro="locators"/>
          <text macro="collection-title" prefix=". "/>
          <text macro="issue"/>
          <text macro="locators-chapter"/>
          <text macro="locators-newspaper" prefix=", "/>
          <text macro="locators-journal"/>
          <text macro="access"/>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"family":"Άγρας","given":"Τέλλος"}],"container-title":"Ποιήματα και πεζά","editor":[{"family":"Σαββίδης","given":"Γ. Π."},{"family":"Καρυωτάκης","given":"Κώστας"}],"id":"ITEM-1","issued":{"date-parts":[["1998"]]},"title":"Ο Καρυωτάκης και οι Σάτιρες","translator":[{"family":"Dimitriadis","given":"Andreas"}],"type":"chapter"}]
    """
    When I cite all items
    Then the result should be:
    """
    Τέλλος Άγρας, «Ο Καρυωτάκης και οι Σάτιρες», στο: Γ. Π. Σαββίδης και Κώστας Καρυωτάκης (επιμ.), <i>Ποιήματα και πεζά</i>, μτφ. Andreas Dimitriadis, 1998.
    """
