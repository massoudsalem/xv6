
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return 0;
}

int
main(void)
{
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	51                   	push   %ecx
    100e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1011:	eb 0a                	jmp    101d <main+0x1d>
    1013:	90                   	nop
    1014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
    1018:	83 f8 02             	cmp    $0x2,%eax
    101b:	7f 76                	jg     1093 <main+0x93>
  while((fd = open("console", O_RDWR)) >= 0){
    101d:	83 ec 08             	sub    $0x8,%esp
    1020:	6a 02                	push   $0x2
    1022:	68 01 23 00 00       	push   $0x2301
    1027:	e8 fd 0e 00 00       	call   1f29 <open>
    102c:	83 c4 10             	add    $0x10,%esp
    102f:	85 c0                	test   %eax,%eax
    1031:	79 e5                	jns    1018 <main+0x18>
    1033:	eb 1f                	jmp    1054 <main+0x54>
    1035:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1038:	80 3d 62 29 00 00 20 	cmpb   $0x20,0x2962
    103f:	74 7a                	je     10bb <main+0xbb>
int
fork1(void)
{
  int pid;

  pid = fork();
    1041:	e8 9b 0e 00 00       	call   1ee1 <fork>
  if(pid == -1)
    1046:	83 f8 ff             	cmp    $0xffffffff,%eax
    1049:	74 3b                	je     1086 <main+0x86>
    if(fork1() == 0)
    104b:	85 c0                	test   %eax,%eax
    104d:	74 57                	je     10a6 <main+0xa6>
    wait();
    104f:	e8 9d 0e 00 00       	call   1ef1 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
    1054:	83 ec 08             	sub    $0x8,%esp
    1057:	6a 64                	push   $0x64
    1059:	68 60 29 00 00       	push   $0x2960
    105e:	e8 9d 00 00 00       	call   1100 <getcmd>
    1063:	83 c4 10             	add    $0x10,%esp
    1066:	85 c0                	test   %eax,%eax
    1068:	78 37                	js     10a1 <main+0xa1>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    106a:	80 3d 60 29 00 00 63 	cmpb   $0x63,0x2960
    1071:	75 ce                	jne    1041 <main+0x41>
    1073:	80 3d 61 29 00 00 64 	cmpb   $0x64,0x2961
    107a:	74 bc                	je     1038 <main+0x38>
  pid = fork();
    107c:	e8 60 0e 00 00       	call   1ee1 <fork>
  if(pid == -1)
    1081:	83 f8 ff             	cmp    $0xffffffff,%eax
    1084:	75 c5                	jne    104b <main+0x4b>
    panic("fork");
    1086:	83 ec 0c             	sub    $0xc,%esp
    1089:	68 8a 22 00 00       	push   $0x228a
    108e:	e8 bd 00 00 00       	call   1150 <panic>
      close(fd);
    1093:	83 ec 0c             	sub    $0xc,%esp
    1096:	50                   	push   %eax
    1097:	e8 75 0e 00 00       	call   1f11 <close>
      break;
    109c:	83 c4 10             	add    $0x10,%esp
    109f:	eb b3                	jmp    1054 <main+0x54>
  exit();
    10a1:	e8 43 0e 00 00       	call   1ee9 <exit>
      runcmd(parsecmd(buf));
    10a6:	83 ec 0c             	sub    $0xc,%esp
    10a9:	68 60 29 00 00       	push   $0x2960
    10ae:	e8 9d 09 00 00       	call   1a50 <parsecmd>
    10b3:	89 04 24             	mov    %eax,(%esp)
    10b6:	e8 b5 00 00 00       	call   1170 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
    10bb:	83 ec 0c             	sub    $0xc,%esp
    10be:	68 60 29 00 00       	push   $0x2960
    10c3:	e8 78 0a 00 00       	call   1b40 <strlen>
      if(chdir(buf+3) < 0)
    10c8:	c7 04 24 63 29 00 00 	movl   $0x2963,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
    10cf:	c6 80 5f 29 00 00 00 	movb   $0x0,0x295f(%eax)
      if(chdir(buf+3) < 0)
    10d6:	e8 7e 0e 00 00       	call   1f59 <chdir>
    10db:	83 c4 10             	add    $0x10,%esp
    10de:	85 c0                	test   %eax,%eax
    10e0:	0f 89 6e ff ff ff    	jns    1054 <main+0x54>
        printf(2, "cannot cd %s\n", buf+3);
    10e6:	50                   	push   %eax
    10e7:	68 63 29 00 00       	push   $0x2963
    10ec:	68 09 23 00 00       	push   $0x2309
    10f1:	6a 02                	push   $0x2
    10f3:	e8 78 0f 00 00       	call   2070 <printf>
    10f8:	83 c4 10             	add    $0x10,%esp
    10fb:	e9 54 ff ff ff       	jmp    1054 <main+0x54>

00001100 <getcmd>:
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	56                   	push   %esi
    1104:	53                   	push   %ebx
    1105:	8b 75 0c             	mov    0xc(%ebp),%esi
    1108:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
    110b:	83 ec 08             	sub    $0x8,%esp
    110e:	68 60 22 00 00       	push   $0x2260
    1113:	6a 02                	push   $0x2
    1115:	e8 56 0f 00 00       	call   2070 <printf>
  memset(buf, 0, nbuf);
    111a:	83 c4 0c             	add    $0xc,%esp
    111d:	56                   	push   %esi
    111e:	6a 00                	push   $0x0
    1120:	53                   	push   %ebx
    1121:	e8 4a 0a 00 00       	call   1b70 <memset>
  gets(buf, nbuf);
    1126:	58                   	pop    %eax
    1127:	5a                   	pop    %edx
    1128:	56                   	push   %esi
    1129:	53                   	push   %ebx
    112a:	e8 a1 0a 00 00       	call   1bd0 <gets>
  if(buf[0] == 0) // EOF
    112f:	83 c4 10             	add    $0x10,%esp
    1132:	31 c0                	xor    %eax,%eax
    1134:	80 3b 00             	cmpb   $0x0,(%ebx)
    1137:	0f 94 c0             	sete   %al
}
    113a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(buf[0] == 0) // EOF
    113d:	f7 d8                	neg    %eax
}
    113f:	5b                   	pop    %ebx
    1140:	5e                   	pop    %esi
    1141:	5d                   	pop    %ebp
    1142:	c3                   	ret    
    1143:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <panic>:
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
    1156:	ff 75 08             	pushl  0x8(%ebp)
    1159:	68 fd 22 00 00       	push   $0x22fd
    115e:	6a 02                	push   $0x2
    1160:	e8 0b 0f 00 00       	call   2070 <printf>
  exit();
    1165:	e8 7f 0d 00 00       	call   1ee9 <exit>
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001170 <runcmd>:
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	83 ec 14             	sub    $0x14,%esp
    1177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
    117a:	85 db                	test   %ebx,%ebx
    117c:	74 3a                	je     11b8 <runcmd+0x48>
  switch(cmd->type){
    117e:	83 3b 05             	cmpl   $0x5,(%ebx)
    1181:	0f 87 06 01 00 00    	ja     128d <runcmd+0x11d>
    1187:	8b 03                	mov    (%ebx),%eax
    1189:	ff 24 85 18 23 00 00 	jmp    *0x2318(,%eax,4)
    if(ecmd->argv[0] == 0)
    1190:	8b 43 04             	mov    0x4(%ebx),%eax
    1193:	85 c0                	test   %eax,%eax
    1195:	74 21                	je     11b8 <runcmd+0x48>
    exec(ecmd->argv[0], ecmd->argv);
    1197:	52                   	push   %edx
    1198:	52                   	push   %edx
    1199:	8d 53 04             	lea    0x4(%ebx),%edx
    119c:	52                   	push   %edx
    119d:	50                   	push   %eax
    119e:	e8 7e 0d 00 00       	call   1f21 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    11a3:	83 c4 0c             	add    $0xc,%esp
    11a6:	ff 73 04             	pushl  0x4(%ebx)
    11a9:	68 6a 22 00 00       	push   $0x226a
    11ae:	6a 02                	push   $0x2
    11b0:	e8 bb 0e 00 00       	call   2070 <printf>
    break;
    11b5:	83 c4 10             	add    $0x10,%esp
    exit();
    11b8:	e8 2c 0d 00 00       	call   1ee9 <exit>
  pid = fork();
    11bd:	e8 1f 0d 00 00       	call   1ee1 <fork>
  if(pid == -1)
    11c2:	83 f8 ff             	cmp    $0xffffffff,%eax
    11c5:	0f 84 cf 00 00 00    	je     129a <runcmd+0x12a>
    if(fork1() == 0)
    11cb:	85 c0                	test   %eax,%eax
    11cd:	75 e9                	jne    11b8 <runcmd+0x48>
      runcmd(bcmd->cmd);
    11cf:	83 ec 0c             	sub    $0xc,%esp
    11d2:	ff 73 04             	pushl  0x4(%ebx)
    11d5:	e8 96 ff ff ff       	call   1170 <runcmd>
    close(rcmd->fd);
    11da:	83 ec 0c             	sub    $0xc,%esp
    11dd:	ff 73 14             	pushl  0x14(%ebx)
    11e0:	e8 2c 0d 00 00       	call   1f11 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    11e5:	59                   	pop    %ecx
    11e6:	58                   	pop    %eax
    11e7:	ff 73 10             	pushl  0x10(%ebx)
    11ea:	ff 73 08             	pushl  0x8(%ebx)
    11ed:	e8 37 0d 00 00       	call   1f29 <open>
    11f2:	83 c4 10             	add    $0x10,%esp
    11f5:	85 c0                	test   %eax,%eax
    11f7:	79 d6                	jns    11cf <runcmd+0x5f>
      printf(2, "open %s failed\n", rcmd->file);
    11f9:	52                   	push   %edx
    11fa:	ff 73 08             	pushl  0x8(%ebx)
    11fd:	68 7a 22 00 00       	push   $0x227a
    1202:	6a 02                	push   $0x2
    1204:	e8 67 0e 00 00       	call   2070 <printf>
      exit();
    1209:	e8 db 0c 00 00       	call   1ee9 <exit>
    if(pipe(p) < 0)
    120e:	8d 45 f0             	lea    -0x10(%ebp),%eax
    1211:	83 ec 0c             	sub    $0xc,%esp
    1214:	50                   	push   %eax
    1215:	e8 df 0c 00 00       	call   1ef9 <pipe>
    121a:	83 c4 10             	add    $0x10,%esp
    121d:	85 c0                	test   %eax,%eax
    121f:	0f 88 b0 00 00 00    	js     12d5 <runcmd+0x165>
  pid = fork();
    1225:	e8 b7 0c 00 00       	call   1ee1 <fork>
  if(pid == -1)
    122a:	83 f8 ff             	cmp    $0xffffffff,%eax
    122d:	74 6b                	je     129a <runcmd+0x12a>
    if(fork1() == 0){
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 84 ab 00 00 00    	je     12e2 <runcmd+0x172>
  pid = fork();
    1237:	e8 a5 0c 00 00       	call   1ee1 <fork>
  if(pid == -1)
    123c:	83 f8 ff             	cmp    $0xffffffff,%eax
    123f:	74 59                	je     129a <runcmd+0x12a>
    if(fork1() == 0){
    1241:	85 c0                	test   %eax,%eax
    1243:	74 62                	je     12a7 <runcmd+0x137>
    close(p[0]);
    1245:	83 ec 0c             	sub    $0xc,%esp
    1248:	ff 75 f0             	pushl  -0x10(%ebp)
    124b:	e8 c1 0c 00 00       	call   1f11 <close>
    close(p[1]);
    1250:	58                   	pop    %eax
    1251:	ff 75 f4             	pushl  -0xc(%ebp)
    1254:	e8 b8 0c 00 00       	call   1f11 <close>
    wait();
    1259:	e8 93 0c 00 00       	call   1ef1 <wait>
    wait();
    125e:	e8 8e 0c 00 00       	call   1ef1 <wait>
    break;
    1263:	83 c4 10             	add    $0x10,%esp
    1266:	e9 4d ff ff ff       	jmp    11b8 <runcmd+0x48>
  pid = fork();
    126b:	e8 71 0c 00 00       	call   1ee1 <fork>
  if(pid == -1)
    1270:	83 f8 ff             	cmp    $0xffffffff,%eax
    1273:	74 25                	je     129a <runcmd+0x12a>
    if(fork1() == 0)
    1275:	85 c0                	test   %eax,%eax
    1277:	0f 84 52 ff ff ff    	je     11cf <runcmd+0x5f>
    wait();
    127d:	e8 6f 0c 00 00       	call   1ef1 <wait>
    runcmd(lcmd->right);
    1282:	83 ec 0c             	sub    $0xc,%esp
    1285:	ff 73 08             	pushl  0x8(%ebx)
    1288:	e8 e3 fe ff ff       	call   1170 <runcmd>
    panic("runcmd");
    128d:	83 ec 0c             	sub    $0xc,%esp
    1290:	68 63 22 00 00       	push   $0x2263
    1295:	e8 b6 fe ff ff       	call   1150 <panic>
    panic("fork");
    129a:	83 ec 0c             	sub    $0xc,%esp
    129d:	68 8a 22 00 00       	push   $0x228a
    12a2:	e8 a9 fe ff ff       	call   1150 <panic>
      close(0);
    12a7:	83 ec 0c             	sub    $0xc,%esp
    12aa:	6a 00                	push   $0x0
    12ac:	e8 60 0c 00 00       	call   1f11 <close>
      dup(p[0]);
    12b1:	5a                   	pop    %edx
    12b2:	ff 75 f0             	pushl  -0x10(%ebp)
    12b5:	e8 a7 0c 00 00       	call   1f61 <dup>
      close(p[0]);
    12ba:	59                   	pop    %ecx
    12bb:	ff 75 f0             	pushl  -0x10(%ebp)
    12be:	e8 4e 0c 00 00       	call   1f11 <close>
      close(p[1]);
    12c3:	58                   	pop    %eax
    12c4:	ff 75 f4             	pushl  -0xc(%ebp)
    12c7:	e8 45 0c 00 00       	call   1f11 <close>
      runcmd(pcmd->right);
    12cc:	58                   	pop    %eax
    12cd:	ff 73 08             	pushl  0x8(%ebx)
    12d0:	e8 9b fe ff ff       	call   1170 <runcmd>
      panic("pipe");
    12d5:	83 ec 0c             	sub    $0xc,%esp
    12d8:	68 8f 22 00 00       	push   $0x228f
    12dd:	e8 6e fe ff ff       	call   1150 <panic>
      close(1);
    12e2:	83 ec 0c             	sub    $0xc,%esp
    12e5:	6a 01                	push   $0x1
    12e7:	e8 25 0c 00 00       	call   1f11 <close>
      dup(p[1]);
    12ec:	58                   	pop    %eax
    12ed:	ff 75 f4             	pushl  -0xc(%ebp)
    12f0:	e8 6c 0c 00 00       	call   1f61 <dup>
      close(p[0]);
    12f5:	58                   	pop    %eax
    12f6:	ff 75 f0             	pushl  -0x10(%ebp)
    12f9:	e8 13 0c 00 00       	call   1f11 <close>
      close(p[1]);
    12fe:	58                   	pop    %eax
    12ff:	ff 75 f4             	pushl  -0xc(%ebp)
    1302:	e8 0a 0c 00 00       	call   1f11 <close>
      runcmd(pcmd->left);
    1307:	58                   	pop    %eax
    1308:	ff 73 04             	pushl  0x4(%ebx)
    130b:	e8 60 fe ff ff       	call   1170 <runcmd>

00001310 <fork1>:
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
    1316:	e8 c6 0b 00 00       	call   1ee1 <fork>
  if(pid == -1)
    131b:	83 f8 ff             	cmp    $0xffffffff,%eax
    131e:	74 02                	je     1322 <fork1+0x12>
  return pid;
}
    1320:	c9                   	leave  
    1321:	c3                   	ret    
    panic("fork");
    1322:	83 ec 0c             	sub    $0xc,%esp
    1325:	68 8a 22 00 00       	push   $0x228a
    132a:	e8 21 fe ff ff       	call   1150 <panic>
    132f:	90                   	nop

00001330 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    1330:	55                   	push   %ebp
    1331:	89 e5                	mov    %esp,%ebp
    1333:	53                   	push   %ebx
    1334:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1337:	6a 54                	push   $0x54
    1339:	e8 82 0a 00 00       	call   1dc0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    133e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
    1341:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1343:	6a 54                	push   $0x54
    1345:	6a 00                	push   $0x0
    1347:	50                   	push   %eax
    1348:	e8 23 08 00 00       	call   1b70 <memset>
  cmd->type = EXEC;
    134d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
    1353:	89 d8                	mov    %ebx,%eax
    1355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1358:	c9                   	leave  
    1359:	c3                   	ret    
    135a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001360 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1367:	6a 18                	push   $0x18
    1369:	e8 52 0a 00 00       	call   1dc0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    136e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
    1371:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1373:	6a 18                	push   $0x18
    1375:	6a 00                	push   $0x0
    1377:	50                   	push   %eax
    1378:	e8 f3 07 00 00       	call   1b70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
    137d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
    1380:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
    1386:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
    1389:	8b 45 0c             	mov    0xc(%ebp),%eax
    138c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
    138f:	8b 45 10             	mov    0x10(%ebp),%eax
    1392:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
    1395:	8b 45 14             	mov    0x14(%ebp),%eax
    1398:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
    139b:	8b 45 18             	mov    0x18(%ebp),%eax
    139e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
    13a1:	89 d8                	mov    %ebx,%eax
    13a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13a6:	c9                   	leave  
    13a7:	c3                   	ret    
    13a8:	90                   	nop
    13a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000013b0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	53                   	push   %ebx
    13b4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13b7:	6a 0c                	push   $0xc
    13b9:	e8 02 0a 00 00       	call   1dc0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13be:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
    13c1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    13c3:	6a 0c                	push   $0xc
    13c5:	6a 00                	push   $0x0
    13c7:	50                   	push   %eax
    13c8:	e8 a3 07 00 00       	call   1b70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
    13cd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
    13d0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
    13d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    13d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13dc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    13df:	89 d8                	mov    %ebx,%eax
    13e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13e4:	c9                   	leave  
    13e5:	c3                   	ret    
    13e6:	8d 76 00             	lea    0x0(%esi),%esi
    13e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013f0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	53                   	push   %ebx
    13f4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13f7:	6a 0c                	push   $0xc
    13f9:	e8 c2 09 00 00       	call   1dc0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13fe:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
    1401:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1403:	6a 0c                	push   $0xc
    1405:	6a 00                	push   $0x0
    1407:	50                   	push   %eax
    1408:	e8 63 07 00 00       	call   1b70 <memset>
  cmd->type = LIST;
  cmd->left = left;
    140d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
    1410:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
    1416:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    1419:	8b 45 0c             	mov    0xc(%ebp),%eax
    141c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    141f:	89 d8                	mov    %ebx,%eax
    1421:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1424:	c9                   	leave  
    1425:	c3                   	ret    
    1426:	8d 76 00             	lea    0x0(%esi),%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001430 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    1430:	55                   	push   %ebp
    1431:	89 e5                	mov    %esp,%ebp
    1433:	53                   	push   %ebx
    1434:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1437:	6a 08                	push   $0x8
    1439:	e8 82 09 00 00       	call   1dc0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    143e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
    1441:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1443:	6a 08                	push   $0x8
    1445:	6a 00                	push   $0x0
    1447:	50                   	push   %eax
    1448:	e8 23 07 00 00       	call   1b70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
    144d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
    1450:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
    1456:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
    1459:	89 d8                	mov    %ebx,%eax
    145b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    145e:	c9                   	leave  
    145f:	c3                   	ret    

00001460 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
    1469:	8b 45 08             	mov    0x8(%ebp),%eax
{
    146c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    146f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
    1472:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
    1474:	39 de                	cmp    %ebx,%esi
    1476:	72 0f                	jb     1487 <gettoken+0x27>
    1478:	eb 25                	jmp    149f <gettoken+0x3f>
    147a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
    1480:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
    1483:	39 f3                	cmp    %esi,%ebx
    1485:	74 18                	je     149f <gettoken+0x3f>
    1487:	0f be 06             	movsbl (%esi),%eax
    148a:	83 ec 08             	sub    $0x8,%esp
    148d:	50                   	push   %eax
    148e:	68 54 29 00 00       	push   $0x2954
    1493:	e8 f8 06 00 00       	call   1b90 <strchr>
    1498:	83 c4 10             	add    $0x10,%esp
    149b:	85 c0                	test   %eax,%eax
    149d:	75 e1                	jne    1480 <gettoken+0x20>
  if(q)
    149f:	85 ff                	test   %edi,%edi
    14a1:	74 02                	je     14a5 <gettoken+0x45>
    *q = s;
    14a3:	89 37                	mov    %esi,(%edi)
  ret = *s;
    14a5:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
    14a8:	3c 29                	cmp    $0x29,%al
    14aa:	7f 54                	jg     1500 <gettoken+0xa0>
    14ac:	3c 28                	cmp    $0x28,%al
    14ae:	0f 8d c8 00 00 00    	jge    157c <gettoken+0x11c>
    14b4:	31 ff                	xor    %edi,%edi
    14b6:	84 c0                	test   %al,%al
    14b8:	0f 85 d2 00 00 00    	jne    1590 <gettoken+0x130>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    14be:	8b 55 14             	mov    0x14(%ebp),%edx
    14c1:	85 d2                	test   %edx,%edx
    14c3:	74 05                	je     14ca <gettoken+0x6a>
    *eq = s;
    14c5:	8b 45 14             	mov    0x14(%ebp),%eax
    14c8:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
    14ca:	39 de                	cmp    %ebx,%esi
    14cc:	72 09                	jb     14d7 <gettoken+0x77>
    14ce:	eb 1f                	jmp    14ef <gettoken+0x8f>
    s++;
    14d0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
    14d3:	39 f3                	cmp    %esi,%ebx
    14d5:	74 18                	je     14ef <gettoken+0x8f>
    14d7:	0f be 06             	movsbl (%esi),%eax
    14da:	83 ec 08             	sub    $0x8,%esp
    14dd:	50                   	push   %eax
    14de:	68 54 29 00 00       	push   $0x2954
    14e3:	e8 a8 06 00 00       	call   1b90 <strchr>
    14e8:	83 c4 10             	add    $0x10,%esp
    14eb:	85 c0                	test   %eax,%eax
    14ed:	75 e1                	jne    14d0 <gettoken+0x70>
  *ps = s;
    14ef:	8b 45 08             	mov    0x8(%ebp),%eax
    14f2:	89 30                	mov    %esi,(%eax)
  return ret;
}
    14f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14f7:	89 f8                	mov    %edi,%eax
    14f9:	5b                   	pop    %ebx
    14fa:	5e                   	pop    %esi
    14fb:	5f                   	pop    %edi
    14fc:	5d                   	pop    %ebp
    14fd:	c3                   	ret    
    14fe:	66 90                	xchg   %ax,%ax
  switch(*s){
    1500:	3c 3e                	cmp    $0x3e,%al
    1502:	75 1c                	jne    1520 <gettoken+0xc0>
    if(*s == '>'){
    1504:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
    1508:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
    150b:	0f 84 a4 00 00 00    	je     15b5 <gettoken+0x155>
    s++;
    1511:	89 c6                	mov    %eax,%esi
    1513:	bf 3e 00 00 00       	mov    $0x3e,%edi
    1518:	eb a4                	jmp    14be <gettoken+0x5e>
    151a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
    1520:	7f 56                	jg     1578 <gettoken+0x118>
    1522:	8d 48 c5             	lea    -0x3b(%eax),%ecx
    1525:	80 f9 01             	cmp    $0x1,%cl
    1528:	76 52                	jbe    157c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    152a:	39 f3                	cmp    %esi,%ebx
    152c:	77 24                	ja     1552 <gettoken+0xf2>
    152e:	eb 70                	jmp    15a0 <gettoken+0x140>
    1530:	0f be 06             	movsbl (%esi),%eax
    1533:	83 ec 08             	sub    $0x8,%esp
    1536:	50                   	push   %eax
    1537:	68 4c 29 00 00       	push   $0x294c
    153c:	e8 4f 06 00 00       	call   1b90 <strchr>
    1541:	83 c4 10             	add    $0x10,%esp
    1544:	85 c0                	test   %eax,%eax
    1546:	75 1f                	jne    1567 <gettoken+0x107>
      s++;
    1548:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    154b:	39 f3                	cmp    %esi,%ebx
    154d:	74 51                	je     15a0 <gettoken+0x140>
    154f:	0f be 06             	movsbl (%esi),%eax
    1552:	83 ec 08             	sub    $0x8,%esp
    1555:	50                   	push   %eax
    1556:	68 54 29 00 00       	push   $0x2954
    155b:	e8 30 06 00 00       	call   1b90 <strchr>
    1560:	83 c4 10             	add    $0x10,%esp
    1563:	85 c0                	test   %eax,%eax
    1565:	74 c9                	je     1530 <gettoken+0xd0>
    ret = 'a';
    1567:	bf 61 00 00 00       	mov    $0x61,%edi
    156c:	e9 4d ff ff ff       	jmp    14be <gettoken+0x5e>
    1571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
    1578:	3c 7c                	cmp    $0x7c,%al
    157a:	75 ae                	jne    152a <gettoken+0xca>
  ret = *s;
    157c:	0f be f8             	movsbl %al,%edi
    s++;
    157f:	83 c6 01             	add    $0x1,%esi
    break;
    1582:	e9 37 ff ff ff       	jmp    14be <gettoken+0x5e>
    1587:	89 f6                	mov    %esi,%esi
    1589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  switch(*s){
    1590:	3c 26                	cmp    $0x26,%al
    1592:	75 96                	jne    152a <gettoken+0xca>
    1594:	eb e6                	jmp    157c <gettoken+0x11c>
    1596:	8d 76 00             	lea    0x0(%esi),%esi
    1599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(eq)
    15a0:	8b 45 14             	mov    0x14(%ebp),%eax
    15a3:	bf 61 00 00 00       	mov    $0x61,%edi
    15a8:	85 c0                	test   %eax,%eax
    15aa:	0f 85 15 ff ff ff    	jne    14c5 <gettoken+0x65>
    15b0:	e9 3a ff ff ff       	jmp    14ef <gettoken+0x8f>
      s++;
    15b5:	83 c6 02             	add    $0x2,%esi
      ret = '+';
    15b8:	bf 2b 00 00 00       	mov    $0x2b,%edi
    15bd:	e9 fc fe ff ff       	jmp    14be <gettoken+0x5e>
    15c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
    15d0:	55                   	push   %ebp
    15d1:	89 e5                	mov    %esp,%ebp
    15d3:	57                   	push   %edi
    15d4:	56                   	push   %esi
    15d5:	53                   	push   %ebx
    15d6:	83 ec 0c             	sub    $0xc,%esp
    15d9:	8b 7d 08             	mov    0x8(%ebp),%edi
    15dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
    15df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
    15e1:	39 f3                	cmp    %esi,%ebx
    15e3:	72 12                	jb     15f7 <peek+0x27>
    15e5:	eb 28                	jmp    160f <peek+0x3f>
    15e7:	89 f6                	mov    %esi,%esi
    15e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
    15f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
    15f3:	39 de                	cmp    %ebx,%esi
    15f5:	74 18                	je     160f <peek+0x3f>
    15f7:	0f be 03             	movsbl (%ebx),%eax
    15fa:	83 ec 08             	sub    $0x8,%esp
    15fd:	50                   	push   %eax
    15fe:	68 54 29 00 00       	push   $0x2954
    1603:	e8 88 05 00 00       	call   1b90 <strchr>
    1608:	83 c4 10             	add    $0x10,%esp
    160b:	85 c0                	test   %eax,%eax
    160d:	75 e1                	jne    15f0 <peek+0x20>
  *ps = s;
    160f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
    1611:	0f be 13             	movsbl (%ebx),%edx
    1614:	31 c0                	xor    %eax,%eax
    1616:	84 d2                	test   %dl,%dl
    1618:	74 17                	je     1631 <peek+0x61>
    161a:	83 ec 08             	sub    $0x8,%esp
    161d:	52                   	push   %edx
    161e:	ff 75 10             	pushl  0x10(%ebp)
    1621:	e8 6a 05 00 00       	call   1b90 <strchr>
    1626:	83 c4 10             	add    $0x10,%esp
    1629:	85 c0                	test   %eax,%eax
    162b:	0f 95 c0             	setne  %al
    162e:	0f b6 c0             	movzbl %al,%eax
}
    1631:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1634:	5b                   	pop    %ebx
    1635:	5e                   	pop    %esi
    1636:	5f                   	pop    %edi
    1637:	5d                   	pop    %ebp
    1638:	c3                   	ret    
    1639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001640 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 1c             	sub    $0x1c,%esp
    1649:	8b 75 0c             	mov    0xc(%ebp),%esi
    164c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    164f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    1650:	83 ec 04             	sub    $0x4,%esp
    1653:	68 b1 22 00 00       	push   $0x22b1
    1658:	53                   	push   %ebx
    1659:	56                   	push   %esi
    165a:	e8 71 ff ff ff       	call   15d0 <peek>
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	85 c0                	test   %eax,%eax
    1664:	74 6a                	je     16d0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
    1666:	6a 00                	push   $0x0
    1668:	6a 00                	push   $0x0
    166a:	53                   	push   %ebx
    166b:	56                   	push   %esi
    166c:	e8 ef fd ff ff       	call   1460 <gettoken>
    1671:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
    1673:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1676:	50                   	push   %eax
    1677:	8d 45 e0             	lea    -0x20(%ebp),%eax
    167a:	50                   	push   %eax
    167b:	53                   	push   %ebx
    167c:	56                   	push   %esi
    167d:	e8 de fd ff ff       	call   1460 <gettoken>
    1682:	83 c4 20             	add    $0x20,%esp
    1685:	83 f8 61             	cmp    $0x61,%eax
    1688:	75 51                	jne    16db <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
    168a:	83 ff 3c             	cmp    $0x3c,%edi
    168d:	74 31                	je     16c0 <parseredirs+0x80>
    168f:	83 ff 3e             	cmp    $0x3e,%edi
    1692:	74 05                	je     1699 <parseredirs+0x59>
    1694:	83 ff 2b             	cmp    $0x2b,%edi
    1697:	75 b7                	jne    1650 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    1699:	83 ec 0c             	sub    $0xc,%esp
    169c:	6a 01                	push   $0x1
    169e:	68 01 02 00 00       	push   $0x201
    16a3:	ff 75 e4             	pushl  -0x1c(%ebp)
    16a6:	ff 75 e0             	pushl  -0x20(%ebp)
    16a9:	ff 75 08             	pushl  0x8(%ebp)
    16ac:	e8 af fc ff ff       	call   1360 <redircmd>
      break;
    16b1:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16b4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    16b7:	eb 97                	jmp    1650 <parseredirs+0x10>
    16b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	6a 00                	push   $0x0
    16c5:	6a 00                	push   $0x0
    16c7:	eb da                	jmp    16a3 <parseredirs+0x63>
    16c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
    16d0:	8b 45 08             	mov    0x8(%ebp),%eax
    16d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16d6:	5b                   	pop    %ebx
    16d7:	5e                   	pop    %esi
    16d8:	5f                   	pop    %edi
    16d9:	5d                   	pop    %ebp
    16da:	c3                   	ret    
      panic("missing file for redirection");
    16db:	83 ec 0c             	sub    $0xc,%esp
    16de:	68 94 22 00 00       	push   $0x2294
    16e3:	e8 68 fa ff ff       	call   1150 <panic>
    16e8:	90                   	nop
    16e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000016f0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	57                   	push   %edi
    16f4:	56                   	push   %esi
    16f5:	53                   	push   %ebx
    16f6:	83 ec 30             	sub    $0x30,%esp
    16f9:	8b 75 08             	mov    0x8(%ebp),%esi
    16fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    16ff:	68 b4 22 00 00       	push   $0x22b4
    1704:	57                   	push   %edi
    1705:	56                   	push   %esi
    1706:	e8 c5 fe ff ff       	call   15d0 <peek>
    170b:	83 c4 10             	add    $0x10,%esp
    170e:	85 c0                	test   %eax,%eax
    1710:	0f 85 92 00 00 00    	jne    17a8 <parseexec+0xb8>
    1716:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
    1718:	e8 13 fc ff ff       	call   1330 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    171d:	83 ec 04             	sub    $0x4,%esp
  ret = execcmd();
    1720:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	50                   	push   %eax
    1726:	e8 15 ff ff ff       	call   1640 <parseredirs>
    172b:	83 c4 10             	add    $0x10,%esp
    172e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1731:	eb 18                	jmp    174b <parseexec+0x5b>
    1733:	90                   	nop
    1734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
    1738:	83 ec 04             	sub    $0x4,%esp
    173b:	57                   	push   %edi
    173c:	56                   	push   %esi
    173d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1740:	e8 fb fe ff ff       	call   1640 <parseredirs>
    1745:	83 c4 10             	add    $0x10,%esp
    1748:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    174b:	83 ec 04             	sub    $0x4,%esp
    174e:	68 cb 22 00 00       	push   $0x22cb
    1753:	57                   	push   %edi
    1754:	56                   	push   %esi
    1755:	e8 76 fe ff ff       	call   15d0 <peek>
    175a:	83 c4 10             	add    $0x10,%esp
    175d:	85 c0                	test   %eax,%eax
    175f:	75 67                	jne    17c8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    1761:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1764:	50                   	push   %eax
    1765:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1768:	50                   	push   %eax
    1769:	57                   	push   %edi
    176a:	56                   	push   %esi
    176b:	e8 f0 fc ff ff       	call   1460 <gettoken>
    1770:	83 c4 10             	add    $0x10,%esp
    1773:	85 c0                	test   %eax,%eax
    1775:	74 51                	je     17c8 <parseexec+0xd8>
    if(tok != 'a')
    1777:	83 f8 61             	cmp    $0x61,%eax
    177a:	75 6b                	jne    17e7 <parseexec+0xf7>
    cmd->argv[argc] = q;
    177c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    177f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1782:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
    1786:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1789:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
    178d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
    1790:	83 fb 0a             	cmp    $0xa,%ebx
    1793:	75 a3                	jne    1738 <parseexec+0x48>
      panic("too many args");
    1795:	83 ec 0c             	sub    $0xc,%esp
    1798:	68 bd 22 00 00       	push   $0x22bd
    179d:	e8 ae f9 ff ff       	call   1150 <panic>
    17a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
    17a8:	83 ec 08             	sub    $0x8,%esp
    17ab:	57                   	push   %edi
    17ac:	56                   	push   %esi
    17ad:	e8 5e 01 00 00       	call   1910 <parseblock>
    17b2:	83 c4 10             	add    $0x10,%esp
    17b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
    17b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17be:	5b                   	pop    %ebx
    17bf:	5e                   	pop    %esi
    17c0:	5f                   	pop    %edi
    17c1:	5d                   	pop    %ebp
    17c2:	c3                   	ret    
    17c3:	90                   	nop
    17c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    17c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
    17cb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
    17ce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
    17d5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
    17dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    17df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17e2:	5b                   	pop    %ebx
    17e3:	5e                   	pop    %esi
    17e4:	5f                   	pop    %edi
    17e5:	5d                   	pop    %ebp
    17e6:	c3                   	ret    
      panic("syntax");
    17e7:	83 ec 0c             	sub    $0xc,%esp
    17ea:	68 b6 22 00 00       	push   $0x22b6
    17ef:	e8 5c f9 ff ff       	call   1150 <panic>
    17f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001800 <parsepipe>:
{
    1800:	55                   	push   %ebp
    1801:	89 e5                	mov    %esp,%ebp
    1803:	57                   	push   %edi
    1804:	56                   	push   %esi
    1805:	53                   	push   %ebx
    1806:	83 ec 14             	sub    $0x14,%esp
    1809:	8b 5d 08             	mov    0x8(%ebp),%ebx
    180c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
    180f:	56                   	push   %esi
    1810:	53                   	push   %ebx
    1811:	e8 da fe ff ff       	call   16f0 <parseexec>
  if(peek(ps, es, "|")){
    1816:	83 c4 0c             	add    $0xc,%esp
  cmd = parseexec(ps, es);
    1819:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
    181b:	68 d0 22 00 00       	push   $0x22d0
    1820:	56                   	push   %esi
    1821:	53                   	push   %ebx
    1822:	e8 a9 fd ff ff       	call   15d0 <peek>
    1827:	83 c4 10             	add    $0x10,%esp
    182a:	85 c0                	test   %eax,%eax
    182c:	75 12                	jne    1840 <parsepipe+0x40>
}
    182e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1831:	89 f8                	mov    %edi,%eax
    1833:	5b                   	pop    %ebx
    1834:	5e                   	pop    %esi
    1835:	5f                   	pop    %edi
    1836:	5d                   	pop    %ebp
    1837:	c3                   	ret    
    1838:	90                   	nop
    1839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
    1840:	6a 00                	push   $0x0
    1842:	6a 00                	push   $0x0
    1844:	56                   	push   %esi
    1845:	53                   	push   %ebx
    1846:	e8 15 fc ff ff       	call   1460 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    184b:	58                   	pop    %eax
    184c:	5a                   	pop    %edx
    184d:	56                   	push   %esi
    184e:	53                   	push   %ebx
    184f:	e8 ac ff ff ff       	call   1800 <parsepipe>
    1854:	89 7d 08             	mov    %edi,0x8(%ebp)
    1857:	89 45 0c             	mov    %eax,0xc(%ebp)
    185a:	83 c4 10             	add    $0x10,%esp
}
    185d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1860:	5b                   	pop    %ebx
    1861:	5e                   	pop    %esi
    1862:	5f                   	pop    %edi
    1863:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    1864:	e9 47 fb ff ff       	jmp    13b0 <pipecmd>
    1869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001870 <parseline>:
{
    1870:	55                   	push   %ebp
    1871:	89 e5                	mov    %esp,%ebp
    1873:	57                   	push   %edi
    1874:	56                   	push   %esi
    1875:	53                   	push   %ebx
    1876:	83 ec 14             	sub    $0x14,%esp
    1879:	8b 5d 08             	mov    0x8(%ebp),%ebx
    187c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
    187f:	56                   	push   %esi
    1880:	53                   	push   %ebx
    1881:	e8 7a ff ff ff       	call   1800 <parsepipe>
  while(peek(ps, es, "&")){
    1886:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
    1889:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
    188b:	eb 1b                	jmp    18a8 <parseline+0x38>
    188d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
    1890:	6a 00                	push   $0x0
    1892:	6a 00                	push   $0x0
    1894:	56                   	push   %esi
    1895:	53                   	push   %ebx
    1896:	e8 c5 fb ff ff       	call   1460 <gettoken>
    cmd = backcmd(cmd);
    189b:	89 3c 24             	mov    %edi,(%esp)
    189e:	e8 8d fb ff ff       	call   1430 <backcmd>
    18a3:	83 c4 10             	add    $0x10,%esp
    18a6:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
    18a8:	83 ec 04             	sub    $0x4,%esp
    18ab:	68 d2 22 00 00       	push   $0x22d2
    18b0:	56                   	push   %esi
    18b1:	53                   	push   %ebx
    18b2:	e8 19 fd ff ff       	call   15d0 <peek>
    18b7:	83 c4 10             	add    $0x10,%esp
    18ba:	85 c0                	test   %eax,%eax
    18bc:	75 d2                	jne    1890 <parseline+0x20>
  if(peek(ps, es, ";")){
    18be:	83 ec 04             	sub    $0x4,%esp
    18c1:	68 ce 22 00 00       	push   $0x22ce
    18c6:	56                   	push   %esi
    18c7:	53                   	push   %ebx
    18c8:	e8 03 fd ff ff       	call   15d0 <peek>
    18cd:	83 c4 10             	add    $0x10,%esp
    18d0:	85 c0                	test   %eax,%eax
    18d2:	75 0c                	jne    18e0 <parseline+0x70>
}
    18d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18d7:	89 f8                	mov    %edi,%eax
    18d9:	5b                   	pop    %ebx
    18da:	5e                   	pop    %esi
    18db:	5f                   	pop    %edi
    18dc:	5d                   	pop    %ebp
    18dd:	c3                   	ret    
    18de:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
    18e0:	6a 00                	push   $0x0
    18e2:	6a 00                	push   $0x0
    18e4:	56                   	push   %esi
    18e5:	53                   	push   %ebx
    18e6:	e8 75 fb ff ff       	call   1460 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    18eb:	58                   	pop    %eax
    18ec:	5a                   	pop    %edx
    18ed:	56                   	push   %esi
    18ee:	53                   	push   %ebx
    18ef:	e8 7c ff ff ff       	call   1870 <parseline>
    18f4:	89 7d 08             	mov    %edi,0x8(%ebp)
    18f7:	89 45 0c             	mov    %eax,0xc(%ebp)
    18fa:	83 c4 10             	add    $0x10,%esp
}
    18fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1900:	5b                   	pop    %ebx
    1901:	5e                   	pop    %esi
    1902:	5f                   	pop    %edi
    1903:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
    1904:	e9 e7 fa ff ff       	jmp    13f0 <listcmd>
    1909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001910 <parseblock>:
{
    1910:	55                   	push   %ebp
    1911:	89 e5                	mov    %esp,%ebp
    1913:	57                   	push   %edi
    1914:	56                   	push   %esi
    1915:	53                   	push   %ebx
    1916:	83 ec 10             	sub    $0x10,%esp
    1919:	8b 5d 08             	mov    0x8(%ebp),%ebx
    191c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
    191f:	68 b4 22 00 00       	push   $0x22b4
    1924:	56                   	push   %esi
    1925:	53                   	push   %ebx
    1926:	e8 a5 fc ff ff       	call   15d0 <peek>
    192b:	83 c4 10             	add    $0x10,%esp
    192e:	85 c0                	test   %eax,%eax
    1930:	74 4a                	je     197c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
    1932:	6a 00                	push   $0x0
    1934:	6a 00                	push   $0x0
    1936:	56                   	push   %esi
    1937:	53                   	push   %ebx
    1938:	e8 23 fb ff ff       	call   1460 <gettoken>
  cmd = parseline(ps, es);
    193d:	58                   	pop    %eax
    193e:	5a                   	pop    %edx
    193f:	56                   	push   %esi
    1940:	53                   	push   %ebx
    1941:	e8 2a ff ff ff       	call   1870 <parseline>
  if(!peek(ps, es, ")"))
    1946:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(ps, es);
    1949:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
    194b:	68 f0 22 00 00       	push   $0x22f0
    1950:	56                   	push   %esi
    1951:	53                   	push   %ebx
    1952:	e8 79 fc ff ff       	call   15d0 <peek>
    1957:	83 c4 10             	add    $0x10,%esp
    195a:	85 c0                	test   %eax,%eax
    195c:	74 2b                	je     1989 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
    195e:	6a 00                	push   $0x0
    1960:	6a 00                	push   $0x0
    1962:	56                   	push   %esi
    1963:	53                   	push   %ebx
    1964:	e8 f7 fa ff ff       	call   1460 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1969:	83 c4 0c             	add    $0xc,%esp
    196c:	56                   	push   %esi
    196d:	53                   	push   %ebx
    196e:	57                   	push   %edi
    196f:	e8 cc fc ff ff       	call   1640 <parseredirs>
}
    1974:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1977:	5b                   	pop    %ebx
    1978:	5e                   	pop    %esi
    1979:	5f                   	pop    %edi
    197a:	5d                   	pop    %ebp
    197b:	c3                   	ret    
    panic("parseblock");
    197c:	83 ec 0c             	sub    $0xc,%esp
    197f:	68 d4 22 00 00       	push   $0x22d4
    1984:	e8 c7 f7 ff ff       	call   1150 <panic>
    panic("syntax - missing )");
    1989:	83 ec 0c             	sub    $0xc,%esp
    198c:	68 df 22 00 00       	push   $0x22df
    1991:	e8 ba f7 ff ff       	call   1150 <panic>
    1996:	8d 76 00             	lea    0x0(%esi),%esi
    1999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000019a0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    19a0:	55                   	push   %ebp
    19a1:	89 e5                	mov    %esp,%ebp
    19a3:	53                   	push   %ebx
    19a4:	83 ec 04             	sub    $0x4,%esp
    19a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    19aa:	85 db                	test   %ebx,%ebx
    19ac:	74 20                	je     19ce <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
    19ae:	83 3b 05             	cmpl   $0x5,(%ebx)
    19b1:	77 1b                	ja     19ce <nulterminate+0x2e>
    19b3:	8b 03                	mov    (%ebx),%eax
    19b5:	ff 24 85 30 23 00 00 	jmp    *0x2330(,%eax,4)
    19bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    19c0:	83 ec 0c             	sub    $0xc,%esp
    19c3:	ff 73 04             	pushl  0x4(%ebx)
    19c6:	e8 d5 ff ff ff       	call   19a0 <nulterminate>
    break;
    19cb:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
    19ce:	89 d8                	mov    %ebx,%eax
    19d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    19d3:	c9                   	leave  
    19d4:	c3                   	ret    
    19d5:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(lcmd->left);
    19d8:	83 ec 0c             	sub    $0xc,%esp
    19db:	ff 73 04             	pushl  0x4(%ebx)
    19de:	e8 bd ff ff ff       	call   19a0 <nulterminate>
    nulterminate(lcmd->right);
    19e3:	58                   	pop    %eax
    19e4:	ff 73 08             	pushl  0x8(%ebx)
    19e7:	e8 b4 ff ff ff       	call   19a0 <nulterminate>
}
    19ec:	89 d8                	mov    %ebx,%eax
    break;
    19ee:	83 c4 10             	add    $0x10,%esp
}
    19f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    19f4:	c9                   	leave  
    19f5:	c3                   	ret    
    19f6:	8d 76 00             	lea    0x0(%esi),%esi
    19f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
    1a00:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1a03:	8d 43 08             	lea    0x8(%ebx),%eax
    1a06:	85 c9                	test   %ecx,%ecx
    1a08:	74 c4                	je     19ce <nulterminate+0x2e>
    1a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    1a10:	8b 50 24             	mov    0x24(%eax),%edx
    1a13:	83 c0 04             	add    $0x4,%eax
    1a16:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
    1a19:	8b 50 fc             	mov    -0x4(%eax),%edx
    1a1c:	85 d2                	test   %edx,%edx
    1a1e:	75 f0                	jne    1a10 <nulterminate+0x70>
}
    1a20:	89 d8                	mov    %ebx,%eax
    1a22:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a25:	c9                   	leave  
    1a26:	c3                   	ret    
    1a27:	89 f6                	mov    %esi,%esi
    1a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(rcmd->cmd);
    1a30:	83 ec 0c             	sub    $0xc,%esp
    1a33:	ff 73 04             	pushl  0x4(%ebx)
    1a36:	e8 65 ff ff ff       	call   19a0 <nulterminate>
    *rcmd->efile = 0;
    1a3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
    1a3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    1a41:	c6 00 00             	movb   $0x0,(%eax)
}
    1a44:	89 d8                	mov    %ebx,%eax
    1a46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a49:	c9                   	leave  
    1a4a:	c3                   	ret    
    1a4b:	90                   	nop
    1a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001a50 <parsecmd>:
{
    1a50:	55                   	push   %ebp
    1a51:	89 e5                	mov    %esp,%ebp
    1a53:	56                   	push   %esi
    1a54:	53                   	push   %ebx
  es = s + strlen(s);
    1a55:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1a58:	83 ec 0c             	sub    $0xc,%esp
    1a5b:	53                   	push   %ebx
    1a5c:	e8 df 00 00 00       	call   1b40 <strlen>
  cmd = parseline(&s, es);
    1a61:	59                   	pop    %ecx
  es = s + strlen(s);
    1a62:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
    1a64:	8d 45 08             	lea    0x8(%ebp),%eax
    1a67:	5e                   	pop    %esi
    1a68:	53                   	push   %ebx
    1a69:	50                   	push   %eax
    1a6a:	e8 01 fe ff ff       	call   1870 <parseline>
    1a6f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
    1a71:	8d 45 08             	lea    0x8(%ebp),%eax
    1a74:	83 c4 0c             	add    $0xc,%esp
    1a77:	68 79 22 00 00       	push   $0x2279
    1a7c:	53                   	push   %ebx
    1a7d:	50                   	push   %eax
    1a7e:	e8 4d fb ff ff       	call   15d0 <peek>
  if(s != es){
    1a83:	8b 45 08             	mov    0x8(%ebp),%eax
    1a86:	83 c4 10             	add    $0x10,%esp
    1a89:	39 d8                	cmp    %ebx,%eax
    1a8b:	75 12                	jne    1a9f <parsecmd+0x4f>
  nulterminate(cmd);
    1a8d:	83 ec 0c             	sub    $0xc,%esp
    1a90:	56                   	push   %esi
    1a91:	e8 0a ff ff ff       	call   19a0 <nulterminate>
}
    1a96:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1a99:	89 f0                	mov    %esi,%eax
    1a9b:	5b                   	pop    %ebx
    1a9c:	5e                   	pop    %esi
    1a9d:	5d                   	pop    %ebp
    1a9e:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
    1a9f:	52                   	push   %edx
    1aa0:	50                   	push   %eax
    1aa1:	68 f2 22 00 00       	push   $0x22f2
    1aa6:	6a 02                	push   $0x2
    1aa8:	e8 c3 05 00 00       	call   2070 <printf>
    panic("syntax");
    1aad:	c7 04 24 b6 22 00 00 	movl   $0x22b6,(%esp)
    1ab4:	e8 97 f6 ff ff       	call   1150 <panic>
    1ab9:	66 90                	xchg   %ax,%ax
    1abb:	66 90                	xchg   %ax,%ax
    1abd:	66 90                	xchg   %ax,%ax
    1abf:	90                   	nop

00001ac0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1ac0:	55                   	push   %ebp
    1ac1:	89 e5                	mov    %esp,%ebp
    1ac3:	53                   	push   %ebx
    1ac4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1aca:	89 c2                	mov    %eax,%edx
    1acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ad0:	83 c1 01             	add    $0x1,%ecx
    1ad3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1ad7:	83 c2 01             	add    $0x1,%edx
    1ada:	84 db                	test   %bl,%bl
    1adc:	88 5a ff             	mov    %bl,-0x1(%edx)
    1adf:	75 ef                	jne    1ad0 <strcpy+0x10>
    ;
  return os;
}
    1ae1:	5b                   	pop    %ebx
    1ae2:	5d                   	pop    %ebp
    1ae3:	c3                   	ret    
    1ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001af0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1af0:	55                   	push   %ebp
    1af1:	89 e5                	mov    %esp,%ebp
    1af3:	53                   	push   %ebx
    1af4:	8b 55 08             	mov    0x8(%ebp),%edx
    1af7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    1afa:	0f b6 02             	movzbl (%edx),%eax
    1afd:	0f b6 19             	movzbl (%ecx),%ebx
    1b00:	84 c0                	test   %al,%al
    1b02:	75 1c                	jne    1b20 <strcmp+0x30>
    1b04:	eb 2a                	jmp    1b30 <strcmp+0x40>
    1b06:	8d 76 00             	lea    0x0(%esi),%esi
    1b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    1b10:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1b13:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    1b16:	83 c1 01             	add    $0x1,%ecx
    1b19:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    1b1c:	84 c0                	test   %al,%al
    1b1e:	74 10                	je     1b30 <strcmp+0x40>
    1b20:	38 d8                	cmp    %bl,%al
    1b22:	74 ec                	je     1b10 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1b24:	29 d8                	sub    %ebx,%eax
}
    1b26:	5b                   	pop    %ebx
    1b27:	5d                   	pop    %ebp
    1b28:	c3                   	ret    
    1b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b30:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1b32:	29 d8                	sub    %ebx,%eax
}
    1b34:	5b                   	pop    %ebx
    1b35:	5d                   	pop    %ebp
    1b36:	c3                   	ret    
    1b37:	89 f6                	mov    %esi,%esi
    1b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001b40 <strlen>:

uint
strlen(const char *s)
{
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1b46:	80 39 00             	cmpb   $0x0,(%ecx)
    1b49:	74 15                	je     1b60 <strlen+0x20>
    1b4b:	31 d2                	xor    %edx,%edx
    1b4d:	8d 76 00             	lea    0x0(%esi),%esi
    1b50:	83 c2 01             	add    $0x1,%edx
    1b53:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    1b57:	89 d0                	mov    %edx,%eax
    1b59:	75 f5                	jne    1b50 <strlen+0x10>
    ;
  return n;
}
    1b5b:	5d                   	pop    %ebp
    1b5c:	c3                   	ret    
    1b5d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    1b60:	31 c0                	xor    %eax,%eax
}
    1b62:	5d                   	pop    %ebp
    1b63:	c3                   	ret    
    1b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001b70 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1b70:	55                   	push   %ebp
    1b71:	89 e5                	mov    %esp,%ebp
    1b73:	57                   	push   %edi
    1b74:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1b77:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1b7a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b7d:	89 d7                	mov    %edx,%edi
    1b7f:	fc                   	cld    
    1b80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1b82:	89 d0                	mov    %edx,%eax
    1b84:	5f                   	pop    %edi
    1b85:	5d                   	pop    %ebp
    1b86:	c3                   	ret    
    1b87:	89 f6                	mov    %esi,%esi
    1b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001b90 <strchr>:

char*
strchr(const char *s, char c)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	53                   	push   %ebx
    1b94:	8b 45 08             	mov    0x8(%ebp),%eax
    1b97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    1b9a:	0f b6 10             	movzbl (%eax),%edx
    1b9d:	84 d2                	test   %dl,%dl
    1b9f:	74 1d                	je     1bbe <strchr+0x2e>
    if(*s == c)
    1ba1:	38 d3                	cmp    %dl,%bl
    1ba3:	89 d9                	mov    %ebx,%ecx
    1ba5:	75 0d                	jne    1bb4 <strchr+0x24>
    1ba7:	eb 17                	jmp    1bc0 <strchr+0x30>
    1ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bb0:	38 ca                	cmp    %cl,%dl
    1bb2:	74 0c                	je     1bc0 <strchr+0x30>
  for(; *s; s++)
    1bb4:	83 c0 01             	add    $0x1,%eax
    1bb7:	0f b6 10             	movzbl (%eax),%edx
    1bba:	84 d2                	test   %dl,%dl
    1bbc:	75 f2                	jne    1bb0 <strchr+0x20>
      return (char*)s;
  return 0;
    1bbe:	31 c0                	xor    %eax,%eax
}
    1bc0:	5b                   	pop    %ebx
    1bc1:	5d                   	pop    %ebp
    1bc2:	c3                   	ret    
    1bc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bd0 <gets>:

char*
gets(char *buf, int max)
{
    1bd0:	55                   	push   %ebp
    1bd1:	89 e5                	mov    %esp,%ebp
    1bd3:	57                   	push   %edi
    1bd4:	56                   	push   %esi
    1bd5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1bd6:	31 f6                	xor    %esi,%esi
    1bd8:	89 f3                	mov    %esi,%ebx
{
    1bda:	83 ec 1c             	sub    $0x1c,%esp
    1bdd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1be0:	eb 2f                	jmp    1c11 <gets+0x41>
    1be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1be8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1beb:	83 ec 04             	sub    $0x4,%esp
    1bee:	6a 01                	push   $0x1
    1bf0:	50                   	push   %eax
    1bf1:	6a 00                	push   $0x0
    1bf3:	e8 09 03 00 00       	call   1f01 <read>
    if(cc < 1)
    1bf8:	83 c4 10             	add    $0x10,%esp
    1bfb:	85 c0                	test   %eax,%eax
    1bfd:	7e 1c                	jle    1c1b <gets+0x4b>
      break;
    buf[i++] = c;
    1bff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c03:	83 c7 01             	add    $0x1,%edi
    1c06:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1c09:	3c 0a                	cmp    $0xa,%al
    1c0b:	74 23                	je     1c30 <gets+0x60>
    1c0d:	3c 0d                	cmp    $0xd,%al
    1c0f:	74 1f                	je     1c30 <gets+0x60>
  for(i=0; i+1 < max; ){
    1c11:	83 c3 01             	add    $0x1,%ebx
    1c14:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1c17:	89 fe                	mov    %edi,%esi
    1c19:	7c cd                	jl     1be8 <gets+0x18>
    1c1b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1c20:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c23:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c26:	5b                   	pop    %ebx
    1c27:	5e                   	pop    %esi
    1c28:	5f                   	pop    %edi
    1c29:	5d                   	pop    %ebp
    1c2a:	c3                   	ret    
    1c2b:	90                   	nop
    1c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c30:	8b 75 08             	mov    0x8(%ebp),%esi
    1c33:	8b 45 08             	mov    0x8(%ebp),%eax
    1c36:	01 de                	add    %ebx,%esi
    1c38:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1c3a:	c6 03 00             	movb   $0x0,(%ebx)
}
    1c3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c40:	5b                   	pop    %ebx
    1c41:	5e                   	pop    %esi
    1c42:	5f                   	pop    %edi
    1c43:	5d                   	pop    %ebp
    1c44:	c3                   	ret    
    1c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c50 <stat>:

int
stat(const char *n, struct stat *st)
{
    1c50:	55                   	push   %ebp
    1c51:	89 e5                	mov    %esp,%ebp
    1c53:	56                   	push   %esi
    1c54:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1c55:	83 ec 08             	sub    $0x8,%esp
    1c58:	6a 00                	push   $0x0
    1c5a:	ff 75 08             	pushl  0x8(%ebp)
    1c5d:	e8 c7 02 00 00       	call   1f29 <open>
  if(fd < 0)
    1c62:	83 c4 10             	add    $0x10,%esp
    1c65:	85 c0                	test   %eax,%eax
    1c67:	78 27                	js     1c90 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    1c69:	83 ec 08             	sub    $0x8,%esp
    1c6c:	ff 75 0c             	pushl  0xc(%ebp)
    1c6f:	89 c3                	mov    %eax,%ebx
    1c71:	50                   	push   %eax
    1c72:	e8 ca 02 00 00       	call   1f41 <fstat>
  close(fd);
    1c77:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1c7a:	89 c6                	mov    %eax,%esi
  close(fd);
    1c7c:	e8 90 02 00 00       	call   1f11 <close>
  return r;
    1c81:	83 c4 10             	add    $0x10,%esp
}
    1c84:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1c87:	89 f0                	mov    %esi,%eax
    1c89:	5b                   	pop    %ebx
    1c8a:	5e                   	pop    %esi
    1c8b:	5d                   	pop    %ebp
    1c8c:	c3                   	ret    
    1c8d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    1c90:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1c95:	eb ed                	jmp    1c84 <stat+0x34>
    1c97:	89 f6                	mov    %esi,%esi
    1c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ca0 <atoi>:

int
atoi(const char *s)
{
    1ca0:	55                   	push   %ebp
    1ca1:	89 e5                	mov    %esp,%ebp
    1ca3:	53                   	push   %ebx
    1ca4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1ca7:	0f be 11             	movsbl (%ecx),%edx
    1caa:	8d 42 d0             	lea    -0x30(%edx),%eax
    1cad:	3c 09                	cmp    $0x9,%al
  n = 0;
    1caf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1cb4:	77 1f                	ja     1cd5 <atoi+0x35>
    1cb6:	8d 76 00             	lea    0x0(%esi),%esi
    1cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1cc0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1cc3:	83 c1 01             	add    $0x1,%ecx
    1cc6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1cca:	0f be 11             	movsbl (%ecx),%edx
    1ccd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1cd0:	80 fb 09             	cmp    $0x9,%bl
    1cd3:	76 eb                	jbe    1cc0 <atoi+0x20>
  return n;
}
    1cd5:	5b                   	pop    %ebx
    1cd6:	5d                   	pop    %ebp
    1cd7:	c3                   	ret    
    1cd8:	90                   	nop
    1cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001ce0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1ce0:	55                   	push   %ebp
    1ce1:	89 e5                	mov    %esp,%ebp
    1ce3:	56                   	push   %esi
    1ce4:	53                   	push   %ebx
    1ce5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    1ceb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1cee:	85 db                	test   %ebx,%ebx
    1cf0:	7e 14                	jle    1d06 <memmove+0x26>
    1cf2:	31 d2                	xor    %edx,%edx
    1cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1cf8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1cfc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1cff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    1d02:	39 d3                	cmp    %edx,%ebx
    1d04:	75 f2                	jne    1cf8 <memmove+0x18>
  return vdst;
}
    1d06:	5b                   	pop    %ebx
    1d07:	5e                   	pop    %esi
    1d08:	5d                   	pop    %ebp
    1d09:	c3                   	ret    
    1d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001d10 <thread_join>:
  
  return clone(start_routine, arg, stack);
}

int thread_join()
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	83 ec 24             	sub    $0x24,%esp
  void * stackPtr;
  int x = join(&stackPtr);
    1d16:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1d19:	50                   	push   %eax
    1d1a:	e8 a2 02 00 00       	call   1fc1 <join>
  return x;
}
    1d1f:	c9                   	leave  
    1d20:	c3                   	ret    
    1d21:	eb 0d                	jmp    1d30 <free>
    1d23:	90                   	nop
    1d24:	90                   	nop
    1d25:	90                   	nop
    1d26:	90                   	nop
    1d27:	90                   	nop
    1d28:	90                   	nop
    1d29:	90                   	nop
    1d2a:	90                   	nop
    1d2b:	90                   	nop
    1d2c:	90                   	nop
    1d2d:	90                   	nop
    1d2e:	90                   	nop
    1d2f:	90                   	nop

00001d30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1d30:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1d31:	a1 c4 29 00 00       	mov    0x29c4,%eax
{
    1d36:	89 e5                	mov    %esp,%ebp
    1d38:	57                   	push   %edi
    1d39:	56                   	push   %esi
    1d3a:	53                   	push   %ebx
    1d3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    1d3e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1d48:	39 c8                	cmp    %ecx,%eax
    1d4a:	8b 10                	mov    (%eax),%edx
    1d4c:	73 32                	jae    1d80 <free+0x50>
    1d4e:	39 d1                	cmp    %edx,%ecx
    1d50:	72 04                	jb     1d56 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1d52:	39 d0                	cmp    %edx,%eax
    1d54:	72 32                	jb     1d88 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1d56:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1d59:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1d5c:	39 fa                	cmp    %edi,%edx
    1d5e:	74 30                	je     1d90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1d60:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1d63:	8b 50 04             	mov    0x4(%eax),%edx
    1d66:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1d69:	39 f1                	cmp    %esi,%ecx
    1d6b:	74 3a                	je     1da7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1d6d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1d6f:	a3 c4 29 00 00       	mov    %eax,0x29c4
}
    1d74:	5b                   	pop    %ebx
    1d75:	5e                   	pop    %esi
    1d76:	5f                   	pop    %edi
    1d77:	5d                   	pop    %ebp
    1d78:	c3                   	ret    
    1d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1d80:	39 d0                	cmp    %edx,%eax
    1d82:	72 04                	jb     1d88 <free+0x58>
    1d84:	39 d1                	cmp    %edx,%ecx
    1d86:	72 ce                	jb     1d56 <free+0x26>
{
    1d88:	89 d0                	mov    %edx,%eax
    1d8a:	eb bc                	jmp    1d48 <free+0x18>
    1d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1d90:	03 72 04             	add    0x4(%edx),%esi
    1d93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1d96:	8b 10                	mov    (%eax),%edx
    1d98:	8b 12                	mov    (%edx),%edx
    1d9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1d9d:	8b 50 04             	mov    0x4(%eax),%edx
    1da0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1da3:	39 f1                	cmp    %esi,%ecx
    1da5:	75 c6                	jne    1d6d <free+0x3d>
    p->s.size += bp->s.size;
    1da7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    1daa:	a3 c4 29 00 00       	mov    %eax,0x29c4
    p->s.size += bp->s.size;
    1daf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1db2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1db5:	89 10                	mov    %edx,(%eax)
}
    1db7:	5b                   	pop    %ebx
    1db8:	5e                   	pop    %esi
    1db9:	5f                   	pop    %edi
    1dba:	5d                   	pop    %ebp
    1dbb:	c3                   	ret    
    1dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001dc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1dc0:	55                   	push   %ebp
    1dc1:	89 e5                	mov    %esp,%ebp
    1dc3:	57                   	push   %edi
    1dc4:	56                   	push   %esi
    1dc5:	53                   	push   %ebx
    1dc6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1dcc:	8b 15 c4 29 00 00    	mov    0x29c4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1dd2:	8d 78 07             	lea    0x7(%eax),%edi
    1dd5:	c1 ef 03             	shr    $0x3,%edi
    1dd8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    1ddb:	85 d2                	test   %edx,%edx
    1ddd:	0f 84 9d 00 00 00    	je     1e80 <malloc+0xc0>
    1de3:	8b 02                	mov    (%edx),%eax
    1de5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1de8:	39 cf                	cmp    %ecx,%edi
    1dea:	76 6c                	jbe    1e58 <malloc+0x98>
    1dec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1df2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1df7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1dfa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1e01:	eb 0e                	jmp    1e11 <malloc+0x51>
    1e03:	90                   	nop
    1e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1e08:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1e0a:	8b 48 04             	mov    0x4(%eax),%ecx
    1e0d:	39 f9                	cmp    %edi,%ecx
    1e0f:	73 47                	jae    1e58 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1e11:	39 05 c4 29 00 00    	cmp    %eax,0x29c4
    1e17:	89 c2                	mov    %eax,%edx
    1e19:	75 ed                	jne    1e08 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    1e1b:	83 ec 0c             	sub    $0xc,%esp
    1e1e:	56                   	push   %esi
    1e1f:	e8 4d 01 00 00       	call   1f71 <sbrk>
  if(p == (char*)-1)
    1e24:	83 c4 10             	add    $0x10,%esp
    1e27:	83 f8 ff             	cmp    $0xffffffff,%eax
    1e2a:	74 1c                	je     1e48 <malloc+0x88>
  hp->s.size = nu;
    1e2c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    1e2f:	83 ec 0c             	sub    $0xc,%esp
    1e32:	83 c0 08             	add    $0x8,%eax
    1e35:	50                   	push   %eax
    1e36:	e8 f5 fe ff ff       	call   1d30 <free>
  return freep;
    1e3b:	8b 15 c4 29 00 00    	mov    0x29c4,%edx
      if((p = morecore(nunits)) == 0)
    1e41:	83 c4 10             	add    $0x10,%esp
    1e44:	85 d2                	test   %edx,%edx
    1e46:	75 c0                	jne    1e08 <malloc+0x48>
        return 0;
  }
    1e48:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1e4b:	31 c0                	xor    %eax,%eax
    1e4d:	5b                   	pop    %ebx
    1e4e:	5e                   	pop    %esi
    1e4f:	5f                   	pop    %edi
    1e50:	5d                   	pop    %ebp
    1e51:	c3                   	ret    
    1e52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1e58:	39 cf                	cmp    %ecx,%edi
    1e5a:	74 54                	je     1eb0 <malloc+0xf0>
        p->s.size -= nunits;
    1e5c:	29 f9                	sub    %edi,%ecx
    1e5e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1e61:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    1e64:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    1e67:	89 15 c4 29 00 00    	mov    %edx,0x29c4
    1e6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1e70:	83 c0 08             	add    $0x8,%eax
    1e73:	5b                   	pop    %ebx
    1e74:	5e                   	pop    %esi
    1e75:	5f                   	pop    %edi
    1e76:	5d                   	pop    %ebp
    1e77:	c3                   	ret    
    1e78:	90                   	nop
    1e79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    1e80:	c7 05 c4 29 00 00 c8 	movl   $0x29c8,0x29c4
    1e87:	29 00 00 
    1e8a:	c7 05 c8 29 00 00 c8 	movl   $0x29c8,0x29c8
    1e91:	29 00 00 
    base.s.size = 0;
    1e94:	b8 c8 29 00 00       	mov    $0x29c8,%eax
    1e99:	c7 05 cc 29 00 00 00 	movl   $0x0,0x29cc
    1ea0:	00 00 00 
    1ea3:	e9 44 ff ff ff       	jmp    1dec <malloc+0x2c>
    1ea8:	90                   	nop
    1ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    1eb0:	8b 08                	mov    (%eax),%ecx
    1eb2:	89 0a                	mov    %ecx,(%edx)
    1eb4:	eb b1                	jmp    1e67 <malloc+0xa7>
    1eb6:	8d 76 00             	lea    0x0(%esi),%esi
    1eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ec0 <thread_create>:
{
    1ec0:	55                   	push   %ebp
    1ec1:	89 e5                	mov    %esp,%ebp
    1ec3:	83 ec 14             	sub    $0x14,%esp
  stack = malloc(4096);
    1ec6:	68 00 10 00 00       	push   $0x1000
    1ecb:	e8 f0 fe ff ff       	call   1dc0 <malloc>
  return clone(start_routine, arg, stack);
    1ed0:	83 c4 0c             	add    $0xc,%esp
    1ed3:	50                   	push   %eax
    1ed4:	ff 75 0c             	pushl  0xc(%ebp)
    1ed7:	ff 75 08             	pushl  0x8(%ebp)
    1eda:	e8 da 00 00 00       	call   1fb9 <clone>
}
    1edf:	c9                   	leave  
    1ee0:	c3                   	ret    

00001ee1 <fork>:
    1ee1:	b8 01 00 00 00       	mov    $0x1,%eax
    1ee6:	cd 40                	int    $0x40
    1ee8:	c3                   	ret    

00001ee9 <exit>:
    1ee9:	b8 02 00 00 00       	mov    $0x2,%eax
    1eee:	cd 40                	int    $0x40
    1ef0:	c3                   	ret    

00001ef1 <wait>:
    1ef1:	b8 03 00 00 00       	mov    $0x3,%eax
    1ef6:	cd 40                	int    $0x40
    1ef8:	c3                   	ret    

00001ef9 <pipe>:
    1ef9:	b8 04 00 00 00       	mov    $0x4,%eax
    1efe:	cd 40                	int    $0x40
    1f00:	c3                   	ret    

00001f01 <read>:
    1f01:	b8 05 00 00 00       	mov    $0x5,%eax
    1f06:	cd 40                	int    $0x40
    1f08:	c3                   	ret    

00001f09 <write>:
    1f09:	b8 10 00 00 00       	mov    $0x10,%eax
    1f0e:	cd 40                	int    $0x40
    1f10:	c3                   	ret    

00001f11 <close>:
    1f11:	b8 15 00 00 00       	mov    $0x15,%eax
    1f16:	cd 40                	int    $0x40
    1f18:	c3                   	ret    

00001f19 <kill>:
    1f19:	b8 06 00 00 00       	mov    $0x6,%eax
    1f1e:	cd 40                	int    $0x40
    1f20:	c3                   	ret    

00001f21 <exec>:
    1f21:	b8 07 00 00 00       	mov    $0x7,%eax
    1f26:	cd 40                	int    $0x40
    1f28:	c3                   	ret    

00001f29 <open>:
    1f29:	b8 0f 00 00 00       	mov    $0xf,%eax
    1f2e:	cd 40                	int    $0x40
    1f30:	c3                   	ret    

00001f31 <mknod>:
    1f31:	b8 11 00 00 00       	mov    $0x11,%eax
    1f36:	cd 40                	int    $0x40
    1f38:	c3                   	ret    

00001f39 <unlink>:
    1f39:	b8 12 00 00 00       	mov    $0x12,%eax
    1f3e:	cd 40                	int    $0x40
    1f40:	c3                   	ret    

00001f41 <fstat>:
    1f41:	b8 08 00 00 00       	mov    $0x8,%eax
    1f46:	cd 40                	int    $0x40
    1f48:	c3                   	ret    

00001f49 <link>:
    1f49:	b8 13 00 00 00       	mov    $0x13,%eax
    1f4e:	cd 40                	int    $0x40
    1f50:	c3                   	ret    

00001f51 <mkdir>:
    1f51:	b8 14 00 00 00       	mov    $0x14,%eax
    1f56:	cd 40                	int    $0x40
    1f58:	c3                   	ret    

00001f59 <chdir>:
    1f59:	b8 09 00 00 00       	mov    $0x9,%eax
    1f5e:	cd 40                	int    $0x40
    1f60:	c3                   	ret    

00001f61 <dup>:
    1f61:	b8 0a 00 00 00       	mov    $0xa,%eax
    1f66:	cd 40                	int    $0x40
    1f68:	c3                   	ret    

00001f69 <getpid>:
    1f69:	b8 0b 00 00 00       	mov    $0xb,%eax
    1f6e:	cd 40                	int    $0x40
    1f70:	c3                   	ret    

00001f71 <sbrk>:
    1f71:	b8 0c 00 00 00       	mov    $0xc,%eax
    1f76:	cd 40                	int    $0x40
    1f78:	c3                   	ret    

00001f79 <sleep>:
    1f79:	b8 0d 00 00 00       	mov    $0xd,%eax
    1f7e:	cd 40                	int    $0x40
    1f80:	c3                   	ret    

00001f81 <uptime>:
    1f81:	b8 0e 00 00 00       	mov    $0xe,%eax
    1f86:	cd 40                	int    $0x40
    1f88:	c3                   	ret    

00001f89 <getreadcount>:
    1f89:	b8 16 00 00 00       	mov    $0x16,%eax
    1f8e:	cd 40                	int    $0x40
    1f90:	c3                   	ret    

00001f91 <gettime>:
    1f91:	b8 17 00 00 00       	mov    $0x17,%eax
    1f96:	cd 40                	int    $0x40
    1f98:	c3                   	ret    

00001f99 <settickets>:
    1f99:	b8 18 00 00 00       	mov    $0x18,%eax
    1f9e:	cd 40                	int    $0x40
    1fa0:	c3                   	ret    

00001fa1 <getpinfo>:
    1fa1:	b8 19 00 00 00       	mov    $0x19,%eax
    1fa6:	cd 40                	int    $0x40
    1fa8:	c3                   	ret    

00001fa9 <mprotect>:
    1fa9:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1fae:	cd 40                	int    $0x40
    1fb0:	c3                   	ret    

00001fb1 <munprotect>:
    1fb1:	b8 1b 00 00 00       	mov    $0x1b,%eax
    1fb6:	cd 40                	int    $0x40
    1fb8:	c3                   	ret    

00001fb9 <clone>:
    1fb9:	b8 1c 00 00 00       	mov    $0x1c,%eax
    1fbe:	cd 40                	int    $0x40
    1fc0:	c3                   	ret    

00001fc1 <join>:
    1fc1:	b8 1d 00 00 00       	mov    $0x1d,%eax
    1fc6:	cd 40                	int    $0x40
    1fc8:	c3                   	ret    
    1fc9:	66 90                	xchg   %ax,%ax
    1fcb:	66 90                	xchg   %ax,%ax
    1fcd:	66 90                	xchg   %ax,%ax
    1fcf:	90                   	nop

00001fd0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1fd0:	55                   	push   %ebp
    1fd1:	89 e5                	mov    %esp,%ebp
    1fd3:	57                   	push   %edi
    1fd4:	56                   	push   %esi
    1fd5:	53                   	push   %ebx
    1fd6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1fd9:	85 d2                	test   %edx,%edx
{
    1fdb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    1fde:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1fe0:	79 76                	jns    2058 <printint+0x88>
    1fe2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1fe6:	74 70                	je     2058 <printint+0x88>
    x = -xx;
    1fe8:	f7 d8                	neg    %eax
    neg = 1;
    1fea:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1ff1:	31 f6                	xor    %esi,%esi
    1ff3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    1ff6:	eb 0a                	jmp    2002 <printint+0x32>
    1ff8:	90                   	nop
    1ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    2000:	89 fe                	mov    %edi,%esi
    2002:	31 d2                	xor    %edx,%edx
    2004:	8d 7e 01             	lea    0x1(%esi),%edi
    2007:	f7 f1                	div    %ecx
    2009:	0f b6 92 50 23 00 00 	movzbl 0x2350(%edx),%edx
  }while((x /= base) != 0);
    2010:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    2012:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    2015:	75 e9                	jne    2000 <printint+0x30>
  if(neg)
    2017:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    201a:	85 c0                	test   %eax,%eax
    201c:	74 08                	je     2026 <printint+0x56>
    buf[i++] = '-';
    201e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    2023:	8d 7e 02             	lea    0x2(%esi),%edi
    2026:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    202a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    202d:	8d 76 00             	lea    0x0(%esi),%esi
    2030:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    2033:	83 ec 04             	sub    $0x4,%esp
    2036:	83 ee 01             	sub    $0x1,%esi
    2039:	6a 01                	push   $0x1
    203b:	53                   	push   %ebx
    203c:	57                   	push   %edi
    203d:	88 45 d7             	mov    %al,-0x29(%ebp)
    2040:	e8 c4 fe ff ff       	call   1f09 <write>

  while(--i >= 0)
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	39 de                	cmp    %ebx,%esi
    204a:	75 e4                	jne    2030 <printint+0x60>
    putc(fd, buf[i]);
}
    204c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    204f:	5b                   	pop    %ebx
    2050:	5e                   	pop    %esi
    2051:	5f                   	pop    %edi
    2052:	5d                   	pop    %ebp
    2053:	c3                   	ret    
    2054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    2058:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    205f:	eb 90                	jmp    1ff1 <printint+0x21>
    2061:	eb 0d                	jmp    2070 <printf>
    2063:	90                   	nop
    2064:	90                   	nop
    2065:	90                   	nop
    2066:	90                   	nop
    2067:	90                   	nop
    2068:	90                   	nop
    2069:	90                   	nop
    206a:	90                   	nop
    206b:	90                   	nop
    206c:	90                   	nop
    206d:	90                   	nop
    206e:	90                   	nop
    206f:	90                   	nop

00002070 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
// bdg 10/05/2015: Add %l
void
printf(int fd, const char *fmt, ...)
{
    2070:	55                   	push   %ebp
    2071:	89 e5                	mov    %esp,%ebp
    2073:	57                   	push   %edi
    2074:	56                   	push   %esi
    2075:	53                   	push   %ebx
    2076:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2079:	8b 75 0c             	mov    0xc(%ebp),%esi
    207c:	0f b6 1e             	movzbl (%esi),%ebx
    207f:	84 db                	test   %bl,%bl
    2081:	0f 84 bf 00 00 00    	je     2146 <printf+0xd6>
    2087:	83 c6 01             	add    $0x1,%esi
  ap = (uint*)(void*)&fmt + 1;
    208a:	8d 7d 10             	lea    0x10(%ebp),%edi
  state = 0;
    208d:	31 d2                	xor    %edx,%edx
    208f:	eb 39                	jmp    20ca <printf+0x5a>
    2091:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    2098:	83 f8 25             	cmp    $0x25,%eax
    209b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    209e:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    20a3:	74 1a                	je     20bf <printf+0x4f>
  write(fd, &c, 1);
    20a5:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    20a8:	83 ec 04             	sub    $0x4,%esp
    20ab:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    20ae:	6a 01                	push   $0x1
    20b0:	50                   	push   %eax
    20b1:	ff 75 08             	pushl  0x8(%ebp)
    20b4:	e8 50 fe ff ff       	call   1f09 <write>
    20b9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    20bc:	83 c4 10             	add    $0x10,%esp
    20bf:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    20c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    20c6:	84 db                	test   %bl,%bl
    20c8:	74 7c                	je     2146 <printf+0xd6>
    if(state == 0){
    20ca:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    20cc:	0f be cb             	movsbl %bl,%ecx
    20cf:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    20d2:	74 c4                	je     2098 <printf+0x28>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    20d4:	83 fa 25             	cmp    $0x25,%edx
    20d7:	75 e6                	jne    20bf <printf+0x4f>
      if(c == 'd'){
    20d9:	83 f8 64             	cmp    $0x64,%eax
    20dc:	0f 84 a6 00 00 00    	je     2188 <printf+0x118>
        printint(fd, *ap, 10, 1);
        ap++;
        } else if(c == 'l') {
    20e2:	83 f8 6c             	cmp    $0x6c,%eax
    20e5:	0f 84 ad 00 00 00    	je     2198 <printf+0x128>
        printlong(fd, *(unsigned long long *)ap, 10, 0);
        // long longs take up 2 argument slots
        ap++;
        ap++;
      } else if(c == 'x' || c == 'p'){
    20eb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    20f1:	83 f9 70             	cmp    $0x70,%ecx
    20f4:	74 5a                	je     2150 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    20f6:	83 f8 73             	cmp    $0x73,%eax
    20f9:	0f 84 e1 00 00 00    	je     21e0 <printf+0x170>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    20ff:	83 f8 63             	cmp    $0x63,%eax
    2102:	0f 84 28 01 00 00    	je     2230 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    2108:	83 f8 25             	cmp    $0x25,%eax
    210b:	74 6b                	je     2178 <printf+0x108>
  write(fd, &c, 1);
    210d:	8d 45 e7             	lea    -0x19(%ebp),%eax
    2110:	83 ec 04             	sub    $0x4,%esp
    2113:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    2117:	6a 01                	push   $0x1
    2119:	50                   	push   %eax
    211a:	ff 75 08             	pushl  0x8(%ebp)
    211d:	e8 e7 fd ff ff       	call   1f09 <write>
    2122:	83 c4 0c             	add    $0xc,%esp
    2125:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    2128:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    212b:	6a 01                	push   $0x1
    212d:	50                   	push   %eax
    212e:	ff 75 08             	pushl  0x8(%ebp)
    2131:	83 c6 01             	add    $0x1,%esi
    2134:	e8 d0 fd ff ff       	call   1f09 <write>
  for(i = 0; fmt[i]; i++){
    2139:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    213d:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    2140:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    2142:	84 db                	test   %bl,%bl
    2144:	75 84                	jne    20ca <printf+0x5a>
    }
  }
}
    2146:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2149:	5b                   	pop    %ebx
    214a:	5e                   	pop    %esi
    214b:	5f                   	pop    %edi
    214c:	5d                   	pop    %ebp
    214d:	c3                   	ret    
    214e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    2150:	83 ec 0c             	sub    $0xc,%esp
    2153:	b9 10 00 00 00       	mov    $0x10,%ecx
    2158:	6a 00                	push   $0x0
    215a:	8b 17                	mov    (%edi),%edx
    215c:	8b 45 08             	mov    0x8(%ebp),%eax
        ap++;
    215f:	83 c7 04             	add    $0x4,%edi
        printint(fd, *ap, 16, 0);
    2162:	e8 69 fe ff ff       	call   1fd0 <printint>
    2167:	83 c4 10             	add    $0x10,%esp
      state = 0;
    216a:	31 d2                	xor    %edx,%edx
    216c:	e9 4e ff ff ff       	jmp    20bf <printf+0x4f>
    2171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    2178:	83 ec 04             	sub    $0x4,%esp
    217b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    217e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2181:	6a 01                	push   $0x1
    2183:	eb a8                	jmp    212d <printf+0xbd>
    2185:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    2188:	83 ec 0c             	sub    $0xc,%esp
    218b:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2190:	6a 01                	push   $0x1
    2192:	eb c6                	jmp    215a <printf+0xea>
    2194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printlong(fd, *(unsigned long long *)ap, 10, 0);
    2198:	8b 57 04             	mov    0x4(%edi),%edx
    219b:	8b 1f                	mov    (%edi),%ebx
    if(upper) printint(fd, upper, 16, 0);
    219d:	85 d2                	test   %edx,%edx
    219f:	74 15                	je     21b6 <printf+0x146>
    21a1:	83 ec 0c             	sub    $0xc,%esp
    21a4:	8b 45 08             	mov    0x8(%ebp),%eax
    21a7:	b9 10 00 00 00       	mov    $0x10,%ecx
    21ac:	6a 00                	push   $0x0
    21ae:	e8 1d fe ff ff       	call   1fd0 <printint>
    21b3:	83 c4 10             	add    $0x10,%esp
    printint(fd, lower, 16, 0);
    21b6:	83 ec 0c             	sub    $0xc,%esp
    21b9:	8b 45 08             	mov    0x8(%ebp),%eax
    21bc:	89 da                	mov    %ebx,%edx
    21be:	6a 00                	push   $0x0
    21c0:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    21c5:	83 c7 08             	add    $0x8,%edi
    printint(fd, lower, 16, 0);
    21c8:	e8 03 fe ff ff       	call   1fd0 <printint>
    21cd:	83 c4 10             	add    $0x10,%esp
      state = 0;
    21d0:	31 d2                	xor    %edx,%edx
    21d2:	e9 e8 fe ff ff       	jmp    20bf <printf+0x4f>
    21d7:	89 f6                	mov    %esi,%esi
    21d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    21e0:	8b 0f                	mov    (%edi),%ecx
        ap++;
    21e2:	83 c7 04             	add    $0x4,%edi
        if(s == 0)
    21e5:	85 c9                	test   %ecx,%ecx
    21e7:	74 6a                	je     2253 <printf+0x1e3>
        while(*s != 0){
    21e9:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    21ec:	31 d2                	xor    %edx,%edx
        s = (char*)*ap;
    21ee:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    21f0:	84 c0                	test   %al,%al
    21f2:	0f 84 c7 fe ff ff    	je     20bf <printf+0x4f>
    21f8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    21fb:	89 de                	mov    %ebx,%esi
    21fd:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2200:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    2203:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    2206:	83 ec 04             	sub    $0x4,%esp
    2209:	6a 01                	push   $0x1
          s++;
    220b:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    220e:	50                   	push   %eax
    220f:	53                   	push   %ebx
    2210:	e8 f4 fc ff ff       	call   1f09 <write>
        while(*s != 0){
    2215:	0f b6 06             	movzbl (%esi),%eax
    2218:	83 c4 10             	add    $0x10,%esp
    221b:	84 c0                	test   %al,%al
    221d:	75 e1                	jne    2200 <printf+0x190>
    221f:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    2222:	31 d2                	xor    %edx,%edx
    2224:	e9 96 fe ff ff       	jmp    20bf <printf+0x4f>
    2229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    2230:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    2232:	83 ec 04             	sub    $0x4,%esp
        ap++;
    2235:	83 c7 04             	add    $0x4,%edi
  write(fd, &c, 1);
    2238:	6a 01                	push   $0x1
        putc(fd, *ap);
    223a:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    223d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    2240:	50                   	push   %eax
    2241:	ff 75 08             	pushl  0x8(%ebp)
    2244:	e8 c0 fc ff ff       	call   1f09 <write>
    2249:	83 c4 10             	add    $0x10,%esp
      state = 0;
    224c:	31 d2                	xor    %edx,%edx
    224e:	e9 6c fe ff ff       	jmp    20bf <printf+0x4f>
          s = "(null)";
    2253:	bb 48 23 00 00       	mov    $0x2348,%ebx
        while(*s != 0){
    2258:	b8 28 00 00 00       	mov    $0x28,%eax
    225d:	eb 99                	jmp    21f8 <printf+0x188>
