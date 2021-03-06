@isTest
public with sharing class F45_DML_UpsertResultWrapperIntTest {
	private static final User TEST_RUNNER = F45_FTY_TestUserFactory.createTestRunner();
	private static final Database.UpsertResult UPSERT_RESULT = createUpsertResult();
	private static final F45_DML_UpsertResultWrapper WRAPPER_UNDER_TEST = new F45_DML_UpsertResultWrapper(UPSERT_RESULT);
    
	@isTest public static void testGetIdShouldReturnAppropriateId() {
		// Arrange
		// Nothing to do here
				
		// Act
		Id resultId;
		Test.startTest();
		System.runAs(TEST_RUNNER) {
			resultId = WRAPPER_UNDER_TEST.getId();
		}
		Test.stopTest();
		
		// Assert
		System.assertEquals(UPSERT_RESULT.id, resultId);
	}

	@isTest public static void testIsSuccessShouldReturnAppropriateStatus() {
		// Arrange
		// Nothing to do here
				
		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_RUNNER) {
			result = WRAPPER_UNDER_TEST.isSuccess();
		}
		Test.stopTest();
		
		// Assert
		System.assertEquals(UPSERT_RESULT.isSuccess(), result);
	}

	@isTest public static void testIsCreatedShouldReturnAppropriateStatus() {
		// Arrange
		// Nothing to do here
				
		// Act
		Boolean result;
		Test.startTest();
		System.runAs(TEST_RUNNER) {
			result = WRAPPER_UNDER_TEST.isCreated();
		}
		Test.stopTest();
		
		// Assert
		System.assertEquals(UPSERT_RESULT.isCreated(), result);
	}

	@isTest public static void testGetErrorListShouldReturnAppropriateResult() {
		// Arrange
		// Nothing to do here
				
		// Act
		List<F45_DML_DatabaseErrorWrapper> resultWrapperList;
		Test.startTest();
		System.runAs(TEST_RUNNER) {
			resultWrapperList = WRAPPER_UNDER_TEST.getErrorList();
		}
		Test.stopTest();
		
		// Assert
		System.assert(resultWrapperList.isEmpty());
	}

	@isTest public static void testWrapperConstructionShouldBePossibleWithoutASeedError() {
		// Arrange
		// Nothing to do here
		
		// Act
		F45_DML_UpsertResultWrapper resultWrapper;
		Test.startTest();
		System.runAs(TEST_RUNNER) {
			resultWrapper = new F45_DML_UpsertResultWrapper();
		}
		Test.stopTest();
		
		// Assert
		System.assertNotEquals(null, resultWrapper);
	}	
    
    private static Database.UpsertResult createUpsertResult() {
		UserRole testUserRole = F45_FTY_TestUserRoleFactory.create(F45_FTY_RecordInsertMode.LATER);
		Boolean notAllOrNone = false;
		return Database.upsert(testUserRole, notAllOrNone); 
    }
}