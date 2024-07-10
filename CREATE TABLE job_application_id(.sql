CREATE TABLE job_application_id(
    job_id INT,
    job_application_idsent_date DATE,
    custom_resume Boolean,
    resume_filename Varchar(225),
    cover_letter_resume Boolean,
    cover_letter_filename Varchar(225),
    status Varchar(50)
);
INSERT into job_application_id(
    job_id,
    job_application_idsent_date,
    custom_resume,
    resume_filename,
    cover_letter_resume,
    cover_letter_filename,
    status
)
values (
    01,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'
),
        (
    02,
    '2024-02-02',
    true,
    'resume_02.pdf',
    false,
    '',
    'submitted'

)
ALTER TABLE job_application_id
ADD contact Varchar(50);

UPDATE job_application_id
set contact='elrich classen'
where job_id=01;

UPDATE job_application_id
set contact = 'hakunna matata'
where job_id=02;

ALTER TABLE job_application_id
RENAME Column contact to contact_name;

ALTER TABLE job_application_id
ALTER Column contact_name type text;

alter TABLE job_application_id
drop Column contact_name;

DROP TABLE job_application_id;

SELECT * FROM job_application_id;