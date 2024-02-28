#ifdef __CLING__
#pragma link C++ nestedclasses;
#pragma link C++ nestedtypedefs;
#pragma link C++ class NEWNAMESPACE::newA + ;

#pragma read sourceClass = "OLDNAMESPACE::oldA" targetClass =                  \
    "NEWNAMESPACE::newA";

// #pragma read source="ClassA::m_a;ClassA::m_b;ClassA::m_c"
// version="[4-5,7,9,12-]" checksum="[12345,123456]" target="ClassB::m_x"
// targetType="int"
// embed="true"
// include="<iostream> <cstdlib>"
// code="{ some C++ code }"

#endif
