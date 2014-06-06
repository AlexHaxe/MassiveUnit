package massive.munit.util;

/**
 * stores a result of a AssertHelper.stringDiff call
 */
class StringDiffResult
{
	public var expected:String;
	public var actual:String;
	public var differenceCount:Int;

	public function new (expected:String, actual:String, differenceCount:Int)
	{
		this.expected = expected;
		this.actual = actual;
		this.differenceCount = differenceCount;
	}

	public function toString():String
	{
		return "expected: \"" + expected + "\" actual: \"" + actual + "\"";
	}
}
