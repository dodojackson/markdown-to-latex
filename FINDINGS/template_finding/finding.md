---
author: Tim
severity: info # info, low, medium, high, critical
---

# Directory Listing

|                    |                                                       |
| ------------------ | :---------------------------------------------------: |
| Typ/Klasse         | OWASP Top 10: A01-2021\\newline Broken Access Control |
| CWE                |                        CWE-548                        |
| Schwere            |                     Informational                     |
| Betroffene Systeme |                       127.0.0.1                       |
|                    |                                                       |

## Beschreibung
Der Webserver verwendet Directory-Listing, d.h. im Falle der Abwesenheit von
Indizierungsdateien (index.html etc.) für einen Unterordner des
Webroot-Verzeichnisses, stellt er eine Auflistung der enthaltenen Dateien zur
Verfügung.

## Potentieller Schaden
Ein Angreifer kann auf diese Weise auf Dateien aufmerksam werden, welche
sensible Informationen enthalten oder die sich für weiterführende Angriffe
nutzen lassen. Der Schaden ist stark abhängig von der konkreten Natur der
offenbarten Dateien und ggf. vorhandener Zugriffskontrollmechanismen, welche die
Dateien vor unauthorisiertem Zugriff schützen.

Im vorliegenden Fall konnten folgende Dateien identifiziert werden usw....

## Empfehlungen
Die Auflistung von Ordnerinhalten kann verhindert werden, indem eine Datei
`index.html` in jedem Ordner abgelegt wird, dessen Inhalte nicht aufgelistet
werden sollen. Diese Datei wird dann stattdessen vom Webserver ausgeliefert.

Da es allerdings in den meisten Fällen keine Notwendigkeit für die Verwendung
von Directory-Listing gibt, kann es üblicherweise in der Konfiguration des
Webservers deaktiviert werden. Diese Option ist weniger fehleranfällig als die
zunächst genannte und sollte ihr daher vorgezogen werden.

## Proof of Concept
Eine Anfrage an die Seite <http://example.com/dir> wird mit einer Auflistung der
Ordnerinhalte von `/dir` beantwortet, siehe Abbildung ^@owasp^.

## Externe Referenzen

1. [cwe-548](https://cwe.mitre.org/data/definitions/548.html)
2. [owasp](https://owasp.org/Top10/A01_2021-Broken_Access_Control/moreandmoress/andmoreand/evenmore)