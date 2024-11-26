using System;
using activitiesUtils;

namespace TestProjectActivitat18
{
    [TestClass]
    public sealed class AgeTests
    {
        [TestMethod]
        [DataRow(0)]
        [DataRow(120)]
        [DataRow(69)]
        public void ValidAgeTest(int ageNum)
        {
            //Arrange (^-^)
            bool IsInRange;

            //Act
            IsInRange = activitiesUtils.Utils.IsValidAge(ageNum);

            //Assert
            Assert.IsTrue(IsInRange);
        }

        [TestMethod]
        [DataRow(-1)]
        [DataRow(121)]
        [DataRow(999)]
        public void InvalidAgeTest(int ageNum)
        {
            //Arrange (^-^)
            bool IsInRange;

            //Act
            IsInRange = activitiesUtils.Utils.IsValidAge(ageNum);

            //Assert
            Assert.IsFalse(IsInRange);
        }
    }
}
