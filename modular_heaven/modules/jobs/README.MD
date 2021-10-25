## Custom Jobs

Adds the Head of Service & The Void Technician, and rearranges nanotrasen internal structuring.

### TG Edits

- code/modules/jobs/job_types/head_of_personnel.dm = departments_list
- code/modules/jobs/jobs.dm = /proc/get_full_job_name(job)
- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/jobs/head_of_personnel.ts
- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/departments.ts

### Defines

- #define ACCESS_HOSE 81
- #define REGION_ACCESS_GENERAL list()
- #define JOB_DISPLAY_ORDER_HEAD_OF_SERVICE 3.5

### Included files that are not contained in this module:

- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/jobs/civil_disputes_officer.ts
- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/jobs/head_of_service.ts
- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/jobs/nanotrasen_representative.ts
- tgui/packages/tgui/interfaces/PreferencesMenu/jobs/jobs/security_medic.ts

### Credits

Bolty - Head of Service
Wallem - Port & TGUI
Kitsunemitsu/KirieStation - Void Tech origination (I think)
