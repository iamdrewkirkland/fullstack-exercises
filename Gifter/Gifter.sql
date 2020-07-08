USE [master]
GO
IF db_id('Gifter') IS NULL
  CREATE DATABASE [Gifter]
GO
USE [Gifter]
GO

DROP TABLE IF EXISTS [Subscription];
DROP TABLE IF EXISTS [Comment];
DROP TABLE IF EXISTS [Post];
DROP TABLE IF EXISTS [UserProfile];

CREATE TABLE [Post] (
  [Id] integer PRIMARY KEY identity NOT NULL,
  [Title] nvarchar(255) NOT NULL,
  [ImageUrl] nvarchar(255) NOT NULL,
  [Caption] nvarchar(255),
  [UserProfileId] integer NOT NULL,
  [DateCreated] datetime NOT NULL
)
GO

CREATE TABLE [UserProfile] (
  [Id] INTEGER PRIMARY KEY IDENTITY NOT NULL,
  [FirebaseUserId] NVARCHAR(28) NOT NULL,
  [Name] NVARCHAR(255) NOT NULL,
  [Email] NVARCHAR(255) NOT NULL,
  [ImageUrl] NVARCHAR(255),
  [Bio] NVARCHAR(255),
  [DateCreated] DATETiME NOT NULL,

  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)
GO

CREATE TABLE [Comment] (
  [Id] integer PRIMARY KEY identity NOT NULL,
  [UserProfileId] integer NOT NULL,
  [PostId] integer NOT NULL,
  [Message] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Subscription] (
  [Id] integer PRIMARY KEY identity NOT NULL,
  [SubscriberId] integer NOT NULL,
  [ProviderId] integer NOT NULL
)
GO

ALTER TABLE [Post] ADD FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
GO
ALTER TABLE [Comment] ADD FOREIGN KEY ([PostId]) REFERENCES [Post] ([Id])
GO
ALTER TABLE [Comment] ADD FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
GO
ALTER TABLE [Subscription] ADD FOREIGN KEY ([SubscriberId]) REFERENCES [UserProfile] ([Id])
GO
ALTER TABLE [Subscription] ADD FOREIGN KEY ([ProviderId]) REFERENCES [UserProfile] ([Id])
GO
SET IDENTITY_INSERT [UserProfile] ON
INSERT INTO [UserProfile]
  ([Id], [FirebaseUserId], [Name], [Email], [ImageUrl], [Bio], [DateCreated])
VALUES 
  (1, 'TaSQfEsb7nOCNxLuuwQFh2VE3RU2', 'Oliver Hardy', 'test@test.com', null, null, '06-21-2020');
INSERT INTO [UserProfile]
  ([Id], [FirebaseUserId], [Name], [Email], [ImageUrl], [Bio], [DateCreated])
VALUES 
  (2, 'YD795qs0o1gmuMMWppQb6m2R8702', 'Stan Laurel', 'test@test.net', null, null, '04-20-2020');
SET IDENTITY_INSERT [UserProfile] OFF
SET IDENTITY_INSERT [Post] ON
INSERT INTO [Post]
  ([Id], [Title], [ImageUrl], [Caption], [UserProfileId], [DateCreated])
VALUES
  (1, 'Wait...what?', 'https://media.giphy.com/media/j609LflrIXInkLNMts/giphy.gif', null, 1, '06-22-2020'),
  (2, 'Stop that', 'https://media.giphy.com/media/jroyKTvw89Dh3J1sss/giphy.gif', 'There''s this guy. He''s in a hall. He want''s you to stop', 1, '06-23-2020'),
  (3, 'Paintball', 'https://media.giphy.com/media/l2R09jc6eZIlfXKlW/giphy.gif', 'I believe I will win', 1, '06-29-2020'),
  (4, 'People!', 'https://media.giphy.com/media/u8mNsDNfHCTUQ/giphy.gif', 'animals are better', 1, '06-29-2020'),
  (5, 'Laughter', 'https://media.giphy.com/media/5vGkcQV9AfDPy/giphy.gif', null, 2, '04-20-2020');
SET IDENTITY_INSERT [Post] OFF
SET IDENTITY_INSERT [Comment] ON
INSERT INTO [Comment]
  ([Id], [UserProfileId], [PostId], [Message])
VALUES
  (1, 2, 1, 'A comment is a comment is a comment');
SET IDENTITY_INSERT [Comment] OFF