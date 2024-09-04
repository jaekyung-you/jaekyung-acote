// 테스트 환경 설정
import 'package:acote/controller/user_detail_controller.dart';
import 'package:acote/model/license_response.dart';
import 'package:acote/model/owner_response.dart';
import 'package:acote/model/repository_response.dart';
import 'package:acote/model/vo/repository_vo.dart';
import 'package:acote/service/dio_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

Future<void> init() async {
  DioApiBase dioApiBase = DioApiBase();
  await dioApiBase.init();
}

Future<void> main() async {
  await init();
  UserDetailController controller = Get.put(UserDetailController());
  controller.username = 'defunkt';

  test('should not be an ad banner', () {
    OwnerResponse testOwner = OwnerResponse(
      login: 'defunkt',
      id: 1,
      nodeId: 'MDQ6VXNlcjI=',
      avatarUrl: 'https://avatars.githubusercontent.com/u/2?v=4',
      gravatarId: '',
      url: 'https://api.github.com/users/defunkt',
      htmlUrl: 'https://github.com/defunkt',
      followersUrl: 'https://api.github.com/users/defunkt/followers',
      followingUrl: 'https://api.github.com/users/defunkt/following{/other_user}',
      gistsUrl: 'https://api.github.com/users/defunkt/gists{/gist_id}',
      starredUrl: 'https://api.github.com/users/defunkt/starred{/owner}{/repo}',
      subscriptionsUrl: 'https://api.github.com/users/defunkt/subscriptions',
      organizationsUrl: 'https://api.github.com/users/defunkt/orgs',
      reposUrl: 'https://api.github.com/users/defunkt/repos',
      eventsUrl: 'https://api.github.com/users/defunkt/events{/privacy}',
      receivedEventsUrl: 'https://api.github.com/users/defunkt/received_events',
      type: 'User',
      siteAdmin: false,
    );

    // 테스트용 RepositoryResponse 클래스
    RepositoryResponse res = RepositoryResponse(
      id: 123456,
      nodeId: 'MDEwOlJlcG9zaXRvcnkxODYxNDAy',
      name: 'ace',
      fullName: 'defunkt/ace',
      private: false,
      owner: testOwner,
      htmlUrl: 'https://github.com/defunkt/ace',
      description: 'Ajax.org Cloud9 Editor',
      fork: true,
      url: 'https://api.github.com/repos/defunkt/ace',
      forksUrl: 'https://api.github.com/repos/defunkt/ace/forks',
      keysUrl: 'https://api.github.com/repos/defunkt/ace/keys{/key_id}',
      collaboratorsUrl: 'https://api.github.com/repos/defunkt/ace/collaborators{/collaborator}',
      teamsUrl: 'https://api.github.com/repos/defunkt/ace/teams',
      hooksUrl: 'https://api.github.com/repos/defunkt/ace/hooks',
      issueEventsUrl: 'https://api.github.com/repos/defunkt/ace/issues/events{/number}',
      eventsUrl: 'https://api.github.com/repos/defunkt/ace/events',
      assigneesUrl: 'https://api.github.com/repos/defunkt/ace/assignees{/user}',
      branchesUrl: 'https://api.github.com/repos/defunkt/ace/branches{/branch}',
      tagsUrl: 'https://api.github.com/repos/defunkt/ace/tags',
      blobsUrl: 'https://api.github.com/repos/defunkt/ace/git/blobs{/sha}',
      gitTagsUrl: 'https://api.github.com/repos/defunkt/ace/git/tags{/sha}',
      gitRefsUrl: 'https://api.github.com/repos/defunkt/ace/git/refs{/sha}',
      treesUrl: 'https://api.github.com/repos/defunkt/ace/git/trees{/sha}',
      statusesUrl: 'https://api.github.com/repos/defunkt/ace/statuses/{sha}',
      languagesUrl: 'https://api.github.com/repos/defunkt/ace/languages',
      stargazersUrl: 'https://api.github.com/repos/defunkt/ace/stargazers',
      contributorsUrl: 'https://api.github.com/repos/defunkt/ace/contributors',
      subscribersUrl: 'https://api.github.com/repos/defunkt/ace/subscribers',
      subscriptionUrl: 'https://api.github.com/repos/defunkt/ace/subscription',
      commitsUrl: 'https://api.github.com/repos/defunkt/ace/commits{/sha}',
      gitCommitsUrl: 'https://api.github.com/repos/defunkt/ace/git/commits{/sha}',
      commentsUrl: 'https://api.github.com/repos/defunkt/ace/comments{/number}',
      issueCommentUrl: 'https://api.github.com/repos/defunkt/ace/issues/comments{/number}',
      contentsUrl: 'https://api.github.com/repos/defunkt/ace/contents/{+path}',
      compareUrl: 'https://api.github.com/repos/defunkt/ace/compare/{base}...{head}',
      mergesUrl: 'https://api.github.com/repos/defunkt/ace/merges',
      archiveUrl: 'https://api.github.com/repos/defunkt/ace/{archive_format}{/ref}',
      downloadsUrl: 'https://api.github.com/repos/defunkt/ace/downloads',
      issuesUrl: 'https://api.github.com/repos/defunkt/ace/issues{/number}',
      pullsUrl: 'https://api.github.com/repos/defunkt/ace/pulls{/number}',
      milestonesUrl: 'https://api.github.com/repos/defunkt/ace/milestones{/number}',
      notificationsUrl: 'https://api.github.com/repos/defunkt/ace/notifications{?since,all,participating}',
      labelsUrl: 'https://api.github.com/repos/defunkt/ace/labels{/name}',
      releasesUrl: 'https://api.github.com/repos/defunkt/ace/releases{/id}',
      deploymentsUrl: 'https://api.github.com/repos/defunkt/ace/deployments',
      createdAt: "2011-06-07T18:41:40Z",
      updatedAt: "2024-02-05T21:15:16Z",
      pushedAt: "2011-11-16T18:37:42Z",
      gitUrl: 'git://github.com/defunkt/ace.git',
      sshUrl: 'git@github.com:defunkt/ace.git',
      cloneUrl: 'https://github.com/defunkt/ace.git',
      svnUrl: 'https://github.com/defunkt/ace',
      homepage: 'http://ace.ajax.org',
      size: 4405,
      stargazersCount: 17,
      watchersCount: 17,
      language: 'JavaScript',
      hasIssues: false,
      hasProjects: true,
      hasDownloads: true,
      hasWiki: true,
      hasPages: false,
      hasDiscussions: false,
      forksCount: 7,
      mirrorUrl: null,
      archived: false,
      disabled: false,
      openIssuesCount: 0,
      license: LicenseResponse(
        key: 'other',
        name: 'Other',
        spdxId: 'NOASSERTION',
        url: null,
        nodeId: 'MDc6TGljZW5zZTA=',
      ),
      allowForking: true,
      isTemplate: false,
      webCommitSignoffRequired: false,
      topics: [],
      visibility: 'public',
      forks: 7,
      openIssues: 0,
      watchers: 17,
      defaultBranch: 'master',
    );

    RepositoryVo result = RepositoryVo(
      repoName: 'ace',
      description: 'Ajax.org Cloud9 Editor',
      username: 'defunkt',
      avatarUrl: 'https://avatars.githubusercontent.com/u/2?v=4',
      starCount: 17,
      language: 'JavaScript',
    );

    expect(controller.convertToRepoVo(res), result);
  });
}
