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

    [TestClass]
    public sealed class DescountAgeTests
    {
        const int NenDesc = 50;
        const int JovesDesc = 25;
        const int AdultDesc = 0;
        const int MajorDesc = 30;

        [TestMethod]
        [DataRow(0)]
        [DataRow(12)]
        [DataRow(8)]
        public void ValidNensDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreEqual(DescResult, NenDesc);
        }

        [TestMethod]
        [DataRow(13)]
        [DataRow(17)]
        [DataRow(15)]
        public void ValidJovesDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreEqual(DescResult, JovesDesc);
        }

        [TestMethod]
        [DataRow(18)]
        [DataRow(64)]
        [DataRow(25)]
        public void ValidAdultsDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreEqual(DescResult, AdultDesc);
        }

        [TestMethod]
        [DataRow(65)]
        [DataRow(120)]
        [DataRow(88)]
        public void ValidMajorsDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreEqual(DescResult, MajorDesc);
        }

        [TestMethod]
        [DataRow(13)]
        public void InvalidNensDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreNotEqual(DescResult, NenDesc);
        }

        [TestMethod]
        [DataRow(12)]
        [DataRow(18)]
        public void InvalidJovesDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreNotEqual(DescResult, JovesDesc);
        }

        [TestMethod]
        [DataRow(17)]
        [DataRow(65)]
        public void InvalidAdultsDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreNotEqual(DescResult, AdultDesc);
        }

        [TestMethod]
        [DataRow(64)]
        [DataRow(121)]
        public void InvalidMajorsDesc(int ageNum)
        {
            //Arrange (^-^)
            int DescResult;

            //Act
            DescResult = activitiesUtils.Utils.AppliedDiscount(ageNum);

            //Assert
            Assert.AreNotEqual(DescResult, JovesDesc);
        }
    }
}
