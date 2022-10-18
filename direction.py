#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


data = pd.read_excel('399.xlsx', sheet_name=2)


# In[3]:


data.major.unique()


# In[9]:


data = data.drop_duplicates()


# In[12]:


data.to_csv('direction.csv', index=False)


# In[ ]:




