#define BOOST_TEST_MODULE impl_test
#include "B.h"
#include <boost/test/included/unit_test.hpp>

BOOST_AUTO_TEST_CASE(printShouldSucceed) {
  B b{1234};
  BOOST_CHECK_NO_THROW(b.print());
}
