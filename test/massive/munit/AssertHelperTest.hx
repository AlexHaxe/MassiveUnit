package massive.munit;

import massive.munit.Assert;
import massive.munit.AssertHelper;

class AssertHelperTest
{
	@Test
	public function testDiff():Void
	{
		Assert.areEqual('expected: "test" actual: "test"', AssertHelper.stringDiff("test", "test").toString());
		Assert.areEqual('expected: "test[]" actual: "test[ ]"', AssertHelper.stringDiff("test", "test ").toString());
		Assert.areEqual('expected: "test[ ]" actual: "test[]"', AssertHelper.stringDiff("test ", "test").toString());
		Assert.areEqual('expected: "[]test" actual: "[ ]test"', AssertHelper.stringDiff("test", " test").toString());
		Assert.areEqual('expected: "[ ]test" actual: "[]test"', AssertHelper.stringDiff(" test", "test").toString());
		Assert.areEqual('expected: "te[]st" actual: "te[ ]st"', AssertHelper.stringDiff("test", "te st").toString());
		Assert.areEqual('expected: "te[ ]st" actual: "te[]st"', AssertHelper.stringDiff("te st", "test").toString());

		Assert.areEqual('expected: "te[]s[t]" actual: "te[t]s[]"', AssertHelper.stringDiff("test", "tets").toString());
		Assert.areEqual('expected: "te[]t[s]" actual: "te[s]t[]"', AssertHelper.stringDiff("tets", "test").toString());
	}
}
