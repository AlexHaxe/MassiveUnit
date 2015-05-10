package massive.munit;

import massive.munit.util.StringDiffResult;

class AssertHelper
{
	/**
	 * Compare two strings and mark differences with [] 
	 *
	 */
	public static function stringDiff(expected:String, actual:String):StringDiffResult
    {
		var indexExpected:Int = 0;
		var indexActual:Int = 0;
		var differences:Int = 0;

		var diffExpected:StringBuf = new StringBuf();
		var diffActual:StringBuf = new StringBuf();

		var inDifference:Bool = false;
		var totalLength:Int = Std.int(Math.max(expected.length, actual.length));
		var expectedChar:String;
		var actualChar:String;
		while ((indexExpected < expected.length) || (indexActual < actual.length))
		{
			expectedChar = "";
			actualChar = "";
			if (indexExpected < expected.length)
			{
				expectedChar = expected.charAt(indexExpected);
			}
			if (indexActual < actual.length)
			{
				actualChar = actual.charAt(indexActual);
			}
			if (expectedChar == actualChar)
			{
				if (inDifference)
				{
					inDifference = false;
					diffExpected.add("]");
					diffActual.add("]");
				}
				diffExpected.add(expectedChar);
				diffActual.add(actualChar);
				indexExpected++;
				indexActual++;
				continue;
			}
            var actualSearch : String = actualChar;
            var expectedSearch : String = expectedChar;
			if (indexExpected + 1 < expected.length)
			{
				expectedSearch += expected.charAt(indexExpected + 1);
			}
			if (indexActual + 1 < actual.length)
			{
				actualSearch += actual.charAt(indexActual + 1);
			}
			var posExpected:Int = expected.indexOf(actualSearch, indexExpected);
			var posActual:Int = actual.indexOf(expectedSearch, indexActual);
			if (!inDifference)
			{
				inDifference = true;
				differences++;
				diffExpected.add("[");
				diffActual.add("[");
			}
			if (posExpected < 0)
			{
				if (posActual < 0)
				{
					diffExpected.add(expectedChar);
					diffActual.add(actualChar);
					indexExpected++;
					indexActual++;
				}
				else
				{
					diffActual.add(actualChar);
					indexActual++;
				}
			}
			else
			{
				if (posActual < 0)
				{
					diffExpected.add(expectedChar);
					indexExpected++;
				}
				else
				{
					if (posExpected < posActual)
					{
						diffExpected.add(expectedChar);
						indexExpected++;
					}
					else
					{
						diffActual.add(actualChar);
						indexActual++;
					}
				}
			}
		}
		if (inDifference)
		{
			inDifference = false;
			diffExpected.add("]");
			diffActual.add("]");
		}
		return new StringDiffResult(diffExpected.toString(), diffActual.toString(), differences);
	}
}
