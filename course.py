#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


data = pd.read_excel('Forty Two.xlsx')


# In[3]:

# 选择除了最后两列的数据
data = data.iloc[:, :-2]
# 删除整行为空值的行
data.dropna(how='all', inplace=True)
# 删去俩特殊的无意义的行
data.drop(data[(data["course name"]=='C-D') | (data["course name"]=='I-M')].index, inplace=True)
# 重置索引
data.reset_index(drop=True, inplace=True)


# In[4]:

# 得出数据里course name特征列不是空值的索引
inx_lis = data[data["course name"].notnull()].index.to_list()


# In[5]:

# 将course name的空值用对应的major填充进去，（同下）
inx = []
for k in range(len(inx_lis)-1):
    for i in range(inx_lis[k],inx_lis[k+1]):
        inx.append(data[data["course name"].notnull()]["course name"].unique()[k])


# In[6]:


for i in range(data.shape[0]-inx_lis[-1]):
    inx.append(data[data["course name"].notnull()]["course name"].unique()[-1])


# In[7]:

# 对原数据的course name重新赋值
data["course name"] = inx


# In[8]:


data["course name"].unique()


# In[9]:

# 将课程的id单独提取出来形成新的一列course_id(分三种情况处理)

# 对course number列的每一项做split分割处理，依据'-'为分隔符，然后取第一个数据便是course_id(同下)
a = data.iloc[:168 :]["course number"].apply(lambda x:x.split('-',)[0]).to_list()
b = data.iloc[168:280 :]["course number"].apply(lambda x:x.split(':',)[0]).to_list()
c = data.iloc[280:375 :]["course number"].apply(lambda x:x.split('-',)[0]).to_list()
d = data.iloc[375: :]["course number"].apply(lambda x:x.split(' ')[0] + ' ' + x.split(' ')[1]).to_list()


# In[10]:

# 将上面得到的全部course_id赋予原数据新的列
data["course_id"] = a+b+c+d


# In[11]:

# 进行数据清洗，将course_id里以空格开头的数据删去开头空格
data["course_id"] = data.course_id.apply(lambda x:x.rstrip())


# In[12]:

# 将课程名称单独提取出来，同提取course_id一样
course_name = []
for i in range(data.shape[0]):
    course_name.append(data["course number"].to_list()[i].replace(data["course_id"].to_list()[i], ''))


# In[13]:

# 清洗上面得到的course_name,删去'-',':'和开头空格这三种特殊符号
data["course_name"] = [i.replace('-', '').replace(':', '').lstrip() for i in course_name]


# In[14]:

# 对原数据的两列进行重命名
data.rename(columns={'course name': 'major', 'course number': 'course_number'}, inplace=True)


# In[15]:

# 清洗数据Prerequisite列中不规范的两个数据
data.loc[7, 'Prerequisite'] = data.loc[7, 'Prerequisite'].replace('61', '60')
data.loc[10, 'Prerequisite'] = data.loc[10, 'Prerequisite'].replace('61', '60')


# In[16]:

# 将course_id放置在数据的第2列（同下）
cid = data.pop('course_id')
data.insert(1,'course_id',cid)


# In[17]:


cname = data.pop('course_name')
data.insert(2,'course_name',cname)


# In[20]:


data.major.unique()


# In[24]:


from sqlalchemy import create_engine


# In[25]:

# 初始化数据库引擎
engine = create_engine('mysql+pymysql://root:@127.0.0.1/cs?charset=utf8mb4', echo=False)


# In[31]:

# 将处理好的数据写入数据库
data.to_sql('course', engine)


# In[ ]:




