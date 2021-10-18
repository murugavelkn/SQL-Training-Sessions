{
 "cells": [
  {
   "cell_type": "markdown",
   "source": [
    "# Challenge: Analyzing Text about Data Science\r\n",
    "\r\n",
    "> *In this notebook, we experiment with using different URL - wikipedia article on Machine Learning. You can see that, unlike Data Science, this article contains a lot of terms, this making the analysis more problematic. We need to come up with another way to clean up the data after doing keyword extraction, to get rid of some frequent, but not meaningful word combinations.*\r\n",
    "\r\n",
    "In this example, let's do a simple exercise that covers all steps of a traditional data science process. You do not have to write any code, you can just click on the cells below to execute them and observe the result. As a challenge, you are encouraged to try this code out with different data. \r\n",
    "\r\n",
    "## Goal\r\n",
    "\r\n",
    "In this lesson, we have been discussing different concepts related to Data Science. Let's try to discover more related concepts by doing some **text mining**. We will start with a text about Data Science, extract keywords from it, and then try to visualize the result.\r\n",
    "\r\n",
    "As a text, I will use the page on Data Science from Wikipedia:"
   ],
   "metadata": {}
  },
  {
   "cell_type": "markdown",
   "source": [],
   "metadata": {}
  },

  {
   "cell_type": "markdown",
   "source": [
    "#### Step 1: Getting the Data\r\n",
    "\r\n",
    "*1. Show Customer Name and Customer Area detail only from Customer Master in Jordan DB for all the customers.*"
   ],
   "metadata": {}
  },

  {
   "cell_type": "code",
   "execution_count": 1,
   "source": [
    "SELECT [Customer_Name] ,[Area]
    FROM [JORDANSALES].[dbo].[JOCustomer]'\r\n",
   ],
   "outputs": [],
   "metadata": {}
  },

}
