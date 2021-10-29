CREATE OR REPLACE FUNCTION GET_REPORT_INFO(p_id IN varchar2) 
RETURN VARCHAR2 
IS 
result_info_txt VARCHAR2(255);
BEGIN
Select
    'Report ID: ' || r.report_id || chr(10) || 'Patient Name: ' || p.patient_fname || ' ' || p.patient_lname || chr(10) || 'Doctor In Charge: Dr. ' || s.staff_lname || chr(10) || 'Consultation Date: ' || to_char(
        cast(cs.consultation_startDatetime as date),
        'DD-MM-YYYY'
    ) || chr(10) || 'Medical Disease: ' || r.medical_disease || chr(10) || 'Service Used: ' || ser.service_name || chr(10) || 'Medicine Prescribed: ' || m.medicine_name || chr(10) || 'Medicine Quantity: ' || md.patMed_quantity || chr(10) || 'Medicine Dosage: ' || m.medicine_dosage INTO result_info_txt
from
    staff s,
    report r,
    patient p,
    consultation cs,
    service ser,
    medicine m,
    Medicine_Distribution md
where
    s.staff_id = cs.staff_id
    and p.patient_id = cs.patient_id
    and r.consultation_id = cs.consultation_id
    and r.service_id = ser.service_id
    and r.report_id = md.report_id
    and md.medicine_id = m.medicine_id
    and p.patient_id = p_id;
return result_info_txt;
END;
    EXECUTE DBMS_OUTPUT.PUT_LINE(GET_REPORT_INFO('P1002'));