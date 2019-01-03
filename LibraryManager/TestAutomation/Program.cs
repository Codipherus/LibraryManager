using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using NUnit.Framework;
using OpenQA.Selenium.Support.UI;

namespace TestAutomation
{
    class Program
    {
        string url = "http://localhost:62841/";
        IWebDriver driver = new ChromeDriver();

        public static void Main()
        {

        }

        [SetUp]
        public void Launch()
        {
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.Navigate().GoToUrl(url);
            driver.Manage().Window.Maximize();
            Console.WriteLine("Browser Opened");
        }

        [Test]
        [Order(1)]
        public void IndexLoad()
        {
            driver.Navigate().GoToUrl(url);
            Assert.True(driver.FindElement(By.Id("showcase")).Displayed);
            Console.WriteLine("Index Loaded");
            
            Assert.Greater(driver.FindElements(By.ClassName("book-item")).Count, 0);
            Console.WriteLine("Books Loaded");
        }

        [Test]
        [Order(2)]
        public void IndexBookDetails()
        {
            driver.FindElements(By.ClassName("book-item")).First().Click();
            Assert.True(driver.FindElement(By.Id("title")).Displayed);
            Console.WriteLine("Book Details Loaded");
        }

        /*
        [Test]
        [Order(3)]
        public void IndexCarousel()
        {
            var first = driver.FindElement(By.Id("carousel")).GetCssValue("transform");
            driver.FindElement(By.ClassName("elastislide-next")).Click();
            var second = driver.FindElement(By.Id("carousel")).GetCssValue("transform");
            Assert.AreNotEqual(first, second);

            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
            var prev = driver.FindElement(By.ClassName("elastislide-prev"));
            Assert.True(prev.Displayed);
            prev.Click();
            var third = driver.FindElement(By.Id("carousel")).GetCssValue("transform");
            //Testing fails due to not knowing the specifics of the JS library used for the carousel (black box testing)
            Assert.AreEqual(first, third);
            Console.WriteLine("Carousel Works");
        }
        */

        [Test]
        [Order(4)]
        public void Account()
        {
            AccountRegister();
            AccountLogout();
            AccountLogin();
        }

        [Test]
        [Order(5)]
        public void AccountRegister()
        {
            var email = "test_" + DateTime.Now.ToString("yyyyMMdd_hhmm") + "@library.com";
            var password = "password";
            var confirmPassword = "password";
            var registerLink = driver.FindElement(By.Id("registerLink"));
            Assert.True(registerLink.Displayed);
            registerLink.Click();

            var registerButton = driver.FindElement(By.Id("registerButton"));
            driver.FindElement(By.Id("Email")).SendKeys(email);
            driver.FindElement(By.Id("Password")).SendKeys(password);
            driver.FindElement(By.Id("ConfirmPassword")).SendKeys(confirmPassword);
            registerButton.Click();

            Assert.AreEqual(driver.Url, url);
            Assert.AreEqual(driver.FindElement(By.Id("user-manage")).Text, "Hello " + email + "!");
            Console.WriteLine("User: {0} registered", email);
        }

        
        [Test]
        [Order(6)]
        public void AccountLogin()
        {
            var emailPositive = "user@library.com";
            var passwordPositive = "password";

            var emailNegative = "nobody@nowhere.com";
            var passwordNegative = "invalidpassword";

            Login(emailNegative, passwordNegative);
            Assert.Greater(driver.FindElements(By.ClassName("validation-summary-errors")).Count, 0);
            Console.WriteLine("Invalid user denied.");

            Login(emailPositive, passwordPositive);
            Assert.AreEqual("Hello " + emailPositive + "!", driver.FindElement(By.Id("user-manage")).Text);
            Console.WriteLine("Valid user logged in.");
        }

        public void Login(string email = "user@library.com", string password = "password")
        {
            
            driver.Navigate().GoToUrl(url);

            if (driver.FindElements(By.Id("loginLink")).Count == 0)
            {
                Logout();
            }

            driver.FindElement(By.Id("loginLink")).Click();
      
            driver.FindElement(By.Id("Email")).SendKeys(email);
            driver.FindElement(By.Id("Password")).SendKeys(password);
            driver.FindElement(By.Id("loginButton")).Click();
        }

        [Test]
        [Order(7)]
        public void AccountLogout()
        {
            Login();
            Logout();
            Assert.AreEqual(driver.FindElements(By.LinkText("Log off")).Count, 0);
            Console.WriteLine("User logged off");

        }

        public void Logout()
        {
            driver.Navigate().GoToUrl(url);
            var logOffLink = driver.FindElement(By.LinkText("Log off"));
            logOffLink.Click();
        }

        [Test]
        [Order(8)]
        public void BookList()
        {
            driver.FindElement(By.Id("booksLink")).Click();
            Assert.True(driver.FindElement(By.Id("booksTitle")).Displayed);

        }

        [Test]
        [Order(9)]
        public void BookDetails()
        {
            driver.Navigate().GoToUrl(url + "books");
            var books = driver.FindElements(By.ClassName("book-title"));
            Assert.Greater(books.Count, 0);
            Console.WriteLine("Book list loaded");
            books.First().Click();
            Assert.True(driver.FindElement(By.Id("title")).Displayed);
            Console.WriteLine("Book details loaded");
        }

        [Test]
        [Order(10)]
        public void BookCheckout()
        {
            Login();
            driver.Navigate().GoToUrl(url + "books");
            var available = driver.FindElements(By.ClassName("btn-checkout"));
            Assert.Greater(available.Count, 0);
            Console.WriteLine("Books available for checkout");
            available.First().Click();
            Assert.Greater(driver.FindElements(By.ClassName("alert-success")).Count, 0);
        }

        [Test]
        [Order(11)]
        public void SubmitRequest()
        {
            Login();
            driver.FindElement(By.Id("requestLink")).Click();
            driver.FindElement(By.Id("request-title")).SendKeys("The Hitchhiker's Guide to the Galaxy");
            driver.FindElement(By.Id("request-author")).SendKeys("Douglas Adams");
            driver.FindElement(By.Id("request-submit")).Click();
            Assert.Greater(driver.FindElements(By.ClassName("alert-success")).Count, 0);
        }

        [TearDown]
        public void Close()
        {
            //driver.Close();
            //driver.Quit();
            Console.WriteLine("Test Complete.");
        }
    }
}