
/home/bettatia/prj/riscv/tb/core/custom/hello_world.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <__vector_start>:
*/

.section .vectors, "ax"
.option norvc
vector_table:
	j sw_irq_handler
   0:	27e0006f          	j	27e <sw_irq_handler>
	j __no_irq_handler
   4:	26a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
   8:	2660006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
   c:	2620006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  10:	25e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  14:	25a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  18:	2560006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  1c:	2520006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  20:	24e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  24:	24a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  28:	2460006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  2c:	2420006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  30:	23e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  34:	23a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  38:	2360006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  3c:	2320006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  40:	22e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  44:	22a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  48:	2260006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  4c:	2220006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  50:	21e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  54:	21a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  58:	2160006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  5c:	2120006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  60:	20e0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  64:	20a0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  68:	2060006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  6c:	2020006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  70:	1fe0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  74:	1fa0006f          	j	26e <__no_irq_handler>
	j __no_irq_handler
  78:	1f60006f          	j	26e <__no_irq_handler>
	j verification_irq_handler
  7c:	27a0006f          	j	2f6 <verification_irq_handler>

Disassembly of section .init:

00000080 <_start>:

_start:
/* initialize global pointer */
.option push
.option norelax
1:	auipc gp, %pcrel_hi(__global_pointer$)
  80:	00002197          	auipc	gp,0x2
	addi  gp, gp, %pcrel_lo(1b)
  84:	65018193          	addi	gp,gp,1616 # 26d0 <__global_pointer$>
.option pop

/* initialize stack pointer */
	la sp, _sp
  88:	00003117          	auipc	sp,0x3
  8c:	ec810113          	addi	sp,sp,-312 # 2f50 <_sp>

/* set vector table address */
	la a0, __vector_start
  90:	00000517          	auipc	a0,0x0
  94:	f7050513          	addi	a0,a0,-144 # 0 <__vector_start>
	csrw mtvec, a0
  98:	30551073          	csrw	mtvec,a0

/* clear the bss segment */
	la a0, __bss_start
  9c:	04418513          	addi	a0,gp,68 # 2714 <_edata>
	la a2, __bss_end
  a0:	07c18613          	addi	a2,gp,124 # 274c <__BSS_END__>
	sub a2, a2, a0
  a4:	8e09                	sub	a2,a2,a0
	li a1, 0
  a6:	4581                	li	a1,0
	call memset
  a8:	2e11                	jal	3bc <memset>

/* new-style constructors and destructors */
	la a0, __libc_fini_array
  aa:	00000517          	auipc	a0,0x0
  ae:	27450513          	addi	a0,a0,628 # 31e <__libc_fini_array>
	call atexit
  b2:	24a1                	jal	2fa <atexit>
	call __libc_init_array
  b4:	2445                	jal	354 <__libc_init_array>

/* call main */
	lw a0, 0(sp)                    /* a0 = argc */
  b6:	4502                	lw	a0,0(sp)
	addi a1, sp, __SIZEOF_POINTER__ /* a1 = argv */
  b8:	004c                	addi	a1,sp,4
	li a2, 0                        /* a2 = envp = NULL */
  ba:	4601                	li	a2,0
	call main
  bc:	2019                	jal	c2 <main>
	tail exit
  be:	a499                	j	304 <exit>

000000c0 <_fini>:
.type   _fini, @function
_init:
_fini:
 /* These don't have to do anything since we use init_array/fini_array. Prevent
    missing symbol error */
	ret
  c0:	8082                	ret

Disassembly of section .text:

000000c2 <main>:
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
      c2:	1141                	addi	sp,sp,-16
      c4:	c606                	sw	ra,12(sp)
    /* inline assembly */
    asm volatile("ecall");
      c6:	00000073          	ecall
    /* write something to stdout */
    printf("hello world!\n");
      ca:	00002537          	lui	a0,0x2
      ce:	de450513          	addi	a0,a0,-540 # 1de4 <_isatty_r+0x2c>
      d2:	2109                	jal	4d4 <puts>
    return EXIT_SUCCESS;
}
      d4:	40b2                	lw	ra,12(sp)
      d6:	4501                	li	a0,0
      d8:	0141                	addi	sp,sp,16
      da:	8082                	ret

000000dc <unimplemented_syscall>:
#    define _isatty isatty
#endif

void unimplemented_syscall()
{
    const char *p = "Unimplemented system call called!\n";
      dc:	000027b7          	lui	a5,0x2
      e0:	df478793          	addi	a5,a5,-524 # 1df4 <_isatty_r+0x3c>
    while (*p)
        *(volatile int *)STDOUT_REG = *(p++);
      e4:	100006b7          	lui	a3,0x10000
    while (*p)
      e8:	0007c703          	lbu	a4,0(a5)
      ec:	e311                	bnez	a4,f0 <unimplemented_syscall+0x14>
}
      ee:	8082                	ret
        *(volatile int *)STDOUT_REG = *(p++);
      f0:	0785                	addi	a5,a5,1
      f2:	c298                	sw	a4,0(a3)
      f4:	bfd5                	j	e8 <unimplemented_syscall+0xc>

000000f6 <nanosleep>:

int nanosleep(const struct timespec *rqtp, struct timespec *rmtp)
{
    errno = ENOSYS;
      f6:	05800713          	li	a4,88
      fa:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
      fe:	557d                	li	a0,-1
     100:	8082                	ret

00000102 <_access>:

int _access(const char *file, int mode)
{
    errno = ENOSYS;
     102:	05800713          	li	a4,88
     106:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     10a:	557d                	li	a0,-1
     10c:	8082                	ret

0000010e <_chdir>:

int _chdir(const char *path)
{
    errno = ENOSYS;
     10e:	05800713          	li	a4,88
     112:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     116:	557d                	li	a0,-1
     118:	8082                	ret

0000011a <_chmod>:

int _chmod(const char *path, mode_t mode)
{
    errno = ENOSYS;
     11a:	05800713          	li	a4,88
     11e:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     122:	557d                	li	a0,-1
     124:	8082                	ret

00000126 <_chown>:

int _chown(const char *path, uid_t owner, gid_t group)
{
    errno = ENOSYS;
     126:	05800713          	li	a4,88
     12a:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     12e:	557d                	li	a0,-1
     130:	8082                	ret

00000132 <_close>:

int _close(int file)
{
    return -1;
}
     132:	557d                	li	a0,-1
     134:	8082                	ret

00000136 <_execve>:

int _execve(const char *name, char *const argv[], char *const env[])
{
    errno = ENOMEM;
     136:	4731                	li	a4,12
     138:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     13c:	557d                	li	a0,-1
     13e:	8082                	ret

00000140 <_exit>:

void _exit(int exit_status)
{
    *(volatile int *)EXIT_REG = exit_status;
     140:	200007b7          	lui	a5,0x20000
     144:	c3c8                	sw	a0,4(a5)
    asm volatile("wfi");
     146:	10500073          	wfi

0000014a <_faccessat>:
}

int _faccessat(int dirfd, const char *file, int mode, int flags)
{
    errno = ENOSYS;
     14a:	05800713          	li	a4,88
     14e:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     152:	557d                	li	a0,-1
     154:	8082                	ret

00000156 <_fork>:

int _fork(void)
{
    errno = EAGAIN;
     156:	472d                	li	a4,11
     158:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     15c:	557d                	li	a0,-1
     15e:	8082                	ret

00000160 <_fstat>:

int _fstat(int file, struct stat *st)
{
    st->st_mode = S_IFCHR;
     160:	6789                	lui	a5,0x2
     162:	c1dc                	sw	a5,4(a1)
    return 0;
    // errno = -ENOSYS;
    // return -1;
}
     164:	4501                	li	a0,0
     166:	8082                	ret

00000168 <_fstatat>:

int _fstatat(int dirfd, const char *file, struct stat *st, int flags)
{
    errno = ENOSYS;
     168:	05800713          	li	a4,88
     16c:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     170:	557d                	li	a0,-1
     172:	8082                	ret

00000174 <_ftime>:
     174:	05800713          	li	a4,88
     178:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
     17c:	557d                	li	a0,-1
     17e:	8082                	ret

00000180 <_getcwd>:
    return -1;
}

char *_getcwd(char *buf, size_t size)
{
    errno = -ENOSYS;
     180:	fa800713          	li	a4,-88
     184:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return NULL;
}
     188:	4501                	li	a0,0
     18a:	8082                	ret

0000018c <_getpid>:

int _getpid()
{
    return 1;
}
     18c:	4505                	li	a0,1
     18e:	8082                	ret

00000190 <_gettimeofday>:

int _gettimeofday(struct timeval *tp, void *tzp)
{
    errno = -ENOSYS;
     190:	fa800713          	li	a4,-88
     194:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     198:	557d                	li	a0,-1
     19a:	8082                	ret

0000019c <_isatty>:

int _isatty(int file)
{
    return (file == STDOUT_FILENO);
     19c:	157d                	addi	a0,a0,-1
}
     19e:	00153513          	seqz	a0,a0
     1a2:	8082                	ret

000001a4 <_kill>:

int _kill(int pid, int sig)
{
    errno = EINVAL;
     1a4:	4759                	li	a4,22
     1a6:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     1aa:	557d                	li	a0,-1
     1ac:	8082                	ret

000001ae <_link>:

int _link(const char *old_name, const char *new_name)
{
    errno = EMLINK;
     1ae:	477d                	li	a4,31
     1b0:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     1b4:	557d                	li	a0,-1
     1b6:	8082                	ret

000001b8 <_lseek>:

off_t _lseek(int file, off_t ptr, int dir)
{
    return 0;
}
     1b8:	4501                	li	a0,0
     1ba:	8082                	ret

000001bc <_lstat>:
     1bc:	05800713          	li	a4,88
     1c0:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
     1c4:	557d                	li	a0,-1
     1c6:	8082                	ret

000001c8 <_open>:
}

int _open(const char *name, int flags, int mode)
{
    return -1;
}
     1c8:	557d                	li	a0,-1
     1ca:	8082                	ret

000001cc <_openat>:
     1cc:	05800713          	li	a4,88
     1d0:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
     1d4:	557d                	li	a0,-1
     1d6:	8082                	ret

000001d8 <_read>:
}

ssize_t _read(int file, void *ptr, size_t len)
{
    return 0;
}
     1d8:	4501                	li	a0,0
     1da:	8082                	ret

000001dc <_stat>:

int _stat(const char *file, struct stat *st)
{
    st->st_mode = S_IFCHR;
     1dc:	6789                	lui	a5,0x2
     1de:	c1dc                	sw	a5,4(a1)
    return 0;
    // errno = ENOSYS;
    // return -1;
}
     1e0:	4501                	li	a0,0
     1e2:	8082                	ret

000001e4 <_sysconf>:

long _sysconf(int name)
{

    return -1;
}
     1e4:	557d                	li	a0,-1
     1e6:	8082                	ret

000001e8 <_times>:

clock_t _times(struct tms *buf)
{
    return -1;
}
     1e8:	557d                	li	a0,-1
     1ea:	8082                	ret

000001ec <_unlink>:

int _unlink(const char *name)
{
    errno = ENOENT;
     1ec:	4709                	li	a4,2
     1ee:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     1f2:	557d                	li	a0,-1
     1f4:	8082                	ret

000001f6 <_utime>:
     1f6:	05800713          	li	a4,88
     1fa:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
     1fe:	557d                	li	a0,-1
     200:	8082                	ret

00000202 <_wait>:
    return -1;
}

int _wait(int *status)
{
    errno = ECHILD;
     202:	4729                	li	a4,10
     204:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
    return -1;
}
     208:	557d                	li	a0,-1
     20a:	8082                	ret

0000020c <_write>:

ssize_t _write(int file, const void *ptr, size_t len)
{
    if (file != STDOUT_FILENO) {
     20c:	4685                	li	a3,1
        errno = ENOSYS;
        return -1;
    }

    const void *eptr = ptr + len;
     20e:	00c587b3          	add	a5,a1,a2
    while (ptr != eptr)
        *(volatile int *)STDOUT_REG = *(char *)(ptr++);
     212:	10000737          	lui	a4,0x10000
    if (file != STDOUT_FILENO) {
     216:	00d50c63          	beq	a0,a3,22e <_write+0x22>
        errno = ENOSYS;
     21a:	05800713          	li	a4,88
     21e:	06e1ac23          	sw	a4,120(gp) # 2748 <errno>
        return -1;
     222:	557d                	li	a0,-1
     224:	8082                	ret
        *(volatile int *)STDOUT_REG = *(char *)(ptr++);
     226:	0585                	addi	a1,a1,1
     228:	fff5c683          	lbu	a3,-1(a1)
     22c:	c314                	sw	a3,0(a4)
    while (ptr != eptr)
     22e:	fef59ce3          	bne	a1,a5,226 <_write+0x1a>
    return len;
     232:	8532                	mv	a0,a2
}
     234:	8082                	ret

00000236 <_brk>:
extern char __heap_end[];
static char *brk = __heap_start;

int _brk(void *addr)
{
    brk = addr;
     236:	02a1aa23          	sw	a0,52(gp) # 2704 <brk>
    return 0;
}
     23a:	4501                	li	a0,0
     23c:	8082                	ret

0000023e <_sbrk>:

void *_sbrk(ptrdiff_t incr)
{
    char *old_brk = brk;

    if (__heap_start == __heap_end) {
     23e:	07c18593          	addi	a1,gp,124 # 274c <__BSS_END__>
     242:	47c18793          	addi	a5,gp,1148 # 2b4c <__heap_end>
    char *old_brk = brk;
     246:	0341a603          	lw	a2,52(gp) # 2704 <brk>
    if (__heap_start == __heap_end) {
     24a:	02f58063          	beq	a1,a5,26a <_sbrk+0x2c>
        return NULL;
    }

    if ((brk += incr) < __heap_end) {
     24e:	00a60733          	add	a4,a2,a0
     252:	02e1aa23          	sw	a4,52(gp) # 2704 <brk>
     256:	00f77763          	bgeu	a4,a5,264 <_sbrk+0x26>
        brk += incr;
     25a:	972a                	add	a4,a4,a0
     25c:	02e1aa23          	sw	a4,52(gp) # 2704 <brk>
    } else {
        brk = __heap_end;
    }
    return old_brk;
}
     260:	8532                	mv	a0,a2
     262:	8082                	ret
        brk = __heap_end;
     264:	02f1aa23          	sw	a5,52(gp) # 2704 <brk>
     268:	bfe5                	j	260 <_sbrk+0x22>
        return NULL;
     26a:	4601                	li	a2,0
     26c:	bfd5                	j	260 <_sbrk+0x22>

0000026e <__no_irq_handler>:
/*	j __no_irq_handler */

.section .text.vecs
/* exception handling */
__no_irq_handler:
	la a0, no_exception_handler_msg
     26e:	00002517          	auipc	a0,0x2
     272:	c3e50513          	addi	a0,a0,-962 # 1eac <no_exception_handler_msg>
	jal ra, puts
     276:	25e000ef          	jal	ra,4d4 <puts>
	j __no_irq_handler
     27a:	ff5ff06f          	j	26e <__no_irq_handler>

0000027e <sw_irq_handler>:


sw_irq_handler:
	csrr t0, mcause
     27e:	342022f3          	csrr	t0,mcause
	slli t0, t0, 1  /* shift off the high bit */
     282:	00129293          	slli	t0,t0,0x1
	srli t0, t0, 1
     286:	0012d293          	srli	t0,t0,0x1
	li t1, 2
     28a:	00200313          	li	t1,2
	beq t0, t1, handle_illegal_insn
     28e:	02628c63          	beq	t0,t1,2c6 <handle_illegal_insn>
	li t1, 11
     292:	00b00313          	li	t1,11
	beq t0, t1, handle_ecall
     296:	00628863          	beq	t0,t1,2a6 <handle_ecall>
	li t1, 3
     29a:	00300313          	li	t1,3
	beq t0, t1, handle_ebreak
     29e:	00628c63          	beq	t0,t1,2b6 <handle_ebreak>
	j handle_unknown
     2a2:	0340006f          	j	2d6 <handle_unknown>

000002a6 <handle_ecall>:

handle_ecall:
	la a0, ecall_msg
     2a6:	00002517          	auipc	a0,0x2
     2aa:	ba050513          	addi	a0,a0,-1120 # 1e46 <ecall_msg>
	jal ra, puts
     2ae:	226000ef          	jal	ra,4d4 <puts>
	j end_handler
     2b2:	0340006f          	j	2e6 <end_handler>

000002b6 <handle_ebreak>:

handle_ebreak:
	la a0, ebreak_msg
     2b6:	00002517          	auipc	a0,0x2
     2ba:	bb150513          	addi	a0,a0,-1103 # 1e67 <ebreak_msg>
	jal ra, puts
     2be:	216000ef          	jal	ra,4d4 <puts>
	j end_handler
     2c2:	0240006f          	j	2e6 <end_handler>

000002c6 <handle_illegal_insn>:

handle_illegal_insn:
	la a0, illegal_insn_msg
     2c6:	00002517          	auipc	a0,0x2
     2ca:	b5150513          	addi	a0,a0,-1199 # 1e17 <illegal_insn_msg>
	jal ra, puts
     2ce:	206000ef          	jal	ra,4d4 <puts>
	j end_handler
     2d2:	0140006f          	j	2e6 <end_handler>

000002d6 <handle_unknown>:

handle_unknown:
	la a0, unknown_msg
     2d6:	00002517          	auipc	a0,0x2
     2da:	bb350513          	addi	a0,a0,-1101 # 1e89 <unknown_msg>
	jal ra, puts
     2de:	1f6000ef          	jal	ra,4d4 <puts>
	j end_handler
     2e2:	0040006f          	j	2e6 <end_handler>

000002e6 <end_handler>:

end_handler:
	csrr a0, mepc
     2e6:	34102573          	csrr	a0,mepc
	addi a0, a0, 4
     2ea:	00450513          	addi	a0,a0,4
	csrw mepc, a0
     2ee:	34151073          	csrw	mepc,a0
	mret
     2f2:	30200073          	mret

000002f6 <verification_irq_handler>:
/* this interrupt can be generated for verification purposes, random or when the PC is equal to a given value*/
verification_irq_handler:
	mret
     2f6:	30200073          	mret

000002fa <atexit>:
     2fa:	85aa                	mv	a1,a0
     2fc:	4681                	li	a3,0
     2fe:	4601                	li	a2,0
     300:	4501                	li	a0,0
     302:	a465                	j	5aa <__register_exitproc>

00000304 <exit>:
     304:	1141                	addi	sp,sp,-16
     306:	4581                	li	a1,0
     308:	c422                	sw	s0,8(sp)
     30a:	c606                	sw	ra,12(sp)
     30c:	842a                	mv	s0,a0
     30e:	2cf5                	jal	60a <__call_exitprocs>
     310:	0301a503          	lw	a0,48(gp) # 2700 <_global_impure_ptr>
     314:	5d5c                	lw	a5,60(a0)
     316:	c391                	beqz	a5,31a <exit+0x16>
     318:	9782                	jalr	a5
     31a:	8522                	mv	a0,s0
     31c:	3515                	jal	140 <_exit>

0000031e <__libc_fini_array>:
     31e:	1141                	addi	sp,sp,-16
     320:	6789                	lui	a5,0x2
     322:	c422                	sw	s0,8(sp)
     324:	6409                	lui	s0,0x2
     326:	ed078713          	addi	a4,a5,-304 # 1ed0 <__DATA_BEGIN__>
     32a:	ed040413          	addi	s0,s0,-304 # 1ed0 <__DATA_BEGIN__>
     32e:	8c19                	sub	s0,s0,a4
     330:	c226                	sw	s1,4(sp)
     332:	c606                	sw	ra,12(sp)
     334:	8409                	srai	s0,s0,0x2
     336:	ed078493          	addi	s1,a5,-304
     33a:	e411                	bnez	s0,346 <__libc_fini_array+0x28>
     33c:	4422                	lw	s0,8(sp)
     33e:	40b2                	lw	ra,12(sp)
     340:	4492                	lw	s1,4(sp)
     342:	0141                	addi	sp,sp,16
     344:	bbb5                	j	c0 <_fini>
     346:	147d                	addi	s0,s0,-1
     348:	00241793          	slli	a5,s0,0x2
     34c:	97a6                	add	a5,a5,s1
     34e:	439c                	lw	a5,0(a5)
     350:	9782                	jalr	a5
     352:	b7e5                	j	33a <__libc_fini_array+0x1c>

00000354 <__libc_init_array>:
     354:	1141                	addi	sp,sp,-16
     356:	6789                	lui	a5,0x2
     358:	c422                	sw	s0,8(sp)
     35a:	6409                	lui	s0,0x2
     35c:	ed078713          	addi	a4,a5,-304 # 1ed0 <__DATA_BEGIN__>
     360:	ed040413          	addi	s0,s0,-304 # 1ed0 <__DATA_BEGIN__>
     364:	8c19                	sub	s0,s0,a4
     366:	c226                	sw	s1,4(sp)
     368:	c04a                	sw	s2,0(sp)
     36a:	c606                	sw	ra,12(sp)
     36c:	8409                	srai	s0,s0,0x2
     36e:	4481                	li	s1,0
     370:	ed078913          	addi	s2,a5,-304
     374:	02849663          	bne	s1,s0,3a0 <__libc_init_array+0x4c>
     378:	33a1                	jal	c0 <_fini>
     37a:	6789                	lui	a5,0x2
     37c:	6409                	lui	s0,0x2
     37e:	ed078713          	addi	a4,a5,-304 # 1ed0 <__DATA_BEGIN__>
     382:	ed040413          	addi	s0,s0,-304 # 1ed0 <__DATA_BEGIN__>
     386:	8c19                	sub	s0,s0,a4
     388:	8409                	srai	s0,s0,0x2
     38a:	4481                	li	s1,0
     38c:	ed078913          	addi	s2,a5,-304
     390:	00849f63          	bne	s1,s0,3ae <__libc_init_array+0x5a>
     394:	40b2                	lw	ra,12(sp)
     396:	4422                	lw	s0,8(sp)
     398:	4492                	lw	s1,4(sp)
     39a:	4902                	lw	s2,0(sp)
     39c:	0141                	addi	sp,sp,16
     39e:	8082                	ret
     3a0:	00249793          	slli	a5,s1,0x2
     3a4:	97ca                	add	a5,a5,s2
     3a6:	439c                	lw	a5,0(a5)
     3a8:	0485                	addi	s1,s1,1
     3aa:	9782                	jalr	a5
     3ac:	b7e1                	j	374 <__libc_init_array+0x20>
     3ae:	00249793          	slli	a5,s1,0x2
     3b2:	97ca                	add	a5,a5,s2
     3b4:	439c                	lw	a5,0(a5)
     3b6:	0485                	addi	s1,s1,1
     3b8:	9782                	jalr	a5
     3ba:	bfd9                	j	390 <__libc_init_array+0x3c>

000003bc <memset>:
     3bc:	433d                	li	t1,15
     3be:	872a                	mv	a4,a0
     3c0:	02c37363          	bgeu	t1,a2,3e6 <memset+0x2a>
     3c4:	00f77793          	andi	a5,a4,15
     3c8:	efbd                	bnez	a5,446 <__heap_size+0x46>
     3ca:	e5ad                	bnez	a1,434 <__heap_size+0x34>
     3cc:	ff067693          	andi	a3,a2,-16
     3d0:	8a3d                	andi	a2,a2,15
     3d2:	96ba                	add	a3,a3,a4
     3d4:	c30c                	sw	a1,0(a4)
     3d6:	c34c                	sw	a1,4(a4)
     3d8:	c70c                	sw	a1,8(a4)
     3da:	c74c                	sw	a1,12(a4)
     3dc:	0741                	addi	a4,a4,16
     3de:	fed76be3          	bltu	a4,a3,3d4 <memset+0x18>
     3e2:	e211                	bnez	a2,3e6 <memset+0x2a>
     3e4:	8082                	ret
     3e6:	40c306b3          	sub	a3,t1,a2
     3ea:	068a                	slli	a3,a3,0x2
     3ec:	00000297          	auipc	t0,0x0
     3f0:	9696                	add	a3,a3,t0
     3f2:	00a68067          	jr	10(a3) # 1000000a <_sp+0xfffd0ba>
     3f6:	00b70723          	sb	a1,14(a4) # 1000000e <_sp+0xfffd0be>
     3fa:	00b706a3          	sb	a1,13(a4)
     3fe:	00b70623          	sb	a1,12(a4)
     402:	00b705a3          	sb	a1,11(a4)
     406:	00b70523          	sb	a1,10(a4)
     40a:	00b704a3          	sb	a1,9(a4)
     40e:	00b70423          	sb	a1,8(a4)
     412:	00b703a3          	sb	a1,7(a4)
     416:	00b70323          	sb	a1,6(a4)
     41a:	00b702a3          	sb	a1,5(a4)
     41e:	00b70223          	sb	a1,4(a4)
     422:	00b701a3          	sb	a1,3(a4)
     426:	00b70123          	sb	a1,2(a4)
     42a:	00b700a3          	sb	a1,1(a4)
     42e:	00b70023          	sb	a1,0(a4)
     432:	8082                	ret
     434:	0ff5f593          	andi	a1,a1,255
     438:	00859693          	slli	a3,a1,0x8
     43c:	8dd5                	or	a1,a1,a3
     43e:	01059693          	slli	a3,a1,0x10
     442:	8dd5                	or	a1,a1,a3
     444:	b761                	j	3cc <memset+0x10>
     446:	00279693          	slli	a3,a5,0x2
     44a:	00000297          	auipc	t0,0x0
     44e:	9696                	add	a3,a3,t0
     450:	8286                	mv	t0,ra
     452:	fa8680e7          	jalr	-88(a3)
     456:	8096                	mv	ra,t0
     458:	17c1                	addi	a5,a5,-16
     45a:	8f1d                	sub	a4,a4,a5
     45c:	963e                	add	a2,a2,a5
     45e:	f8c374e3          	bgeu	t1,a2,3e6 <memset+0x2a>
     462:	b7a5                	j	3ca <memset+0xe>

00000464 <_puts_r>:
     464:	7139                	addi	sp,sp,-64
     466:	dc22                	sw	s0,56(sp)
     468:	842a                	mv	s0,a0
     46a:	852e                	mv	a0,a1
     46c:	c62e                	sw	a1,12(sp)
     46e:	de06                	sw	ra,60(sp)
     470:	2225                	jal	598 <strlen>
     472:	000027b7          	lui	a5,0x2
     476:	ecc78793          	addi	a5,a5,-308 # 1ecc <no_exception_handler_msg+0x20>
     47a:	d43e                	sw	a5,40(sp)
     47c:	4785                	li	a5,1
     47e:	d63e                	sw	a5,44(sp)
     480:	101c                	addi	a5,sp,32
     482:	45b2                	lw	a1,12(sp)
     484:	ca3e                	sw	a5,20(sp)
     486:	4789                	li	a5,2
     488:	cc3e                	sw	a5,24(sp)
     48a:	5c1c                	lw	a5,56(s0)
     48c:	d22a                	sw	a0,36(sp)
     48e:	0505                	addi	a0,a0,1
     490:	d02e                	sw	a1,32(sp)
     492:	ce2a                	sw	a0,28(sp)
     494:	440c                	lw	a1,8(s0)
     496:	e789                	bnez	a5,4a0 <_puts_r+0x3c>
     498:	8522                	mv	a0,s0
     49a:	c62e                	sw	a1,12(sp)
     49c:	2cf9                	jal	77a <__sinit>
     49e:	45b2                	lw	a1,12(sp)
     4a0:	00c59783          	lh	a5,12(a1)
     4a4:	01279713          	slli	a4,a5,0x12
     4a8:	00074b63          	bltz	a4,4be <_puts_r+0x5a>
     4ac:	6689                	lui	a3,0x2
     4ae:	51f8                	lw	a4,100(a1)
     4b0:	8fd5                	or	a5,a5,a3
     4b2:	00f59623          	sh	a5,12(a1)
     4b6:	77f9                	lui	a5,0xffffe
     4b8:	17fd                	addi	a5,a5,-1
     4ba:	8ff9                	and	a5,a5,a4
     4bc:	d1fc                	sw	a5,100(a1)
     4be:	0850                	addi	a2,sp,20
     4c0:	8522                	mv	a0,s0
     4c2:	2d21                	jal	ada <__sfvwrite_r>
     4c4:	57fd                	li	a5,-1
     4c6:	e111                	bnez	a0,4ca <_puts_r+0x66>
     4c8:	47a9                	li	a5,10
     4ca:	50f2                	lw	ra,60(sp)
     4cc:	5462                	lw	s0,56(sp)
     4ce:	853e                	mv	a0,a5
     4d0:	6121                	addi	sp,sp,64
     4d2:	8082                	ret

000004d4 <puts>:
     4d4:	85aa                	mv	a1,a0
     4d6:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
     4da:	b769                	j	464 <_puts_r>

000004dc <cleanup_glue>:
     4dc:	1141                	addi	sp,sp,-16
     4de:	c422                	sw	s0,8(sp)
     4e0:	842e                	mv	s0,a1
     4e2:	418c                	lw	a1,0(a1)
     4e4:	c226                	sw	s1,4(sp)
     4e6:	c606                	sw	ra,12(sp)
     4e8:	84aa                	mv	s1,a0
     4ea:	c191                	beqz	a1,4ee <cleanup_glue+0x12>
     4ec:	3fc5                	jal	4dc <cleanup_glue>
     4ee:	85a2                	mv	a1,s0
     4f0:	4422                	lw	s0,8(sp)
     4f2:	40b2                	lw	ra,12(sp)
     4f4:	8526                	mv	a0,s1
     4f6:	4492                	lw	s1,4(sp)
     4f8:	0141                	addi	sp,sp,16
     4fa:	a189                	j	93c <_free_r>

000004fc <_reclaim_reent>:
     4fc:	0381a783          	lw	a5,56(gp) # 2708 <_impure_ptr>
     500:	08a78b63          	beq	a5,a0,596 <_reclaim_reent+0x9a>
     504:	457c                	lw	a5,76(a0)
     506:	1101                	addi	sp,sp,-32
     508:	cc22                	sw	s0,24(sp)
     50a:	ca26                	sw	s1,20(sp)
     50c:	c84a                	sw	s2,16(sp)
     50e:	ce06                	sw	ra,28(sp)
     510:	c64e                	sw	s3,12(sp)
     512:	842a                	mv	s0,a0
     514:	4481                	li	s1,0
     516:	08000913          	li	s2,128
     51a:	e3a1                	bnez	a5,55a <_reclaim_reent+0x5e>
     51c:	402c                	lw	a1,64(s0)
     51e:	c199                	beqz	a1,524 <_reclaim_reent+0x28>
     520:	8522                	mv	a0,s0
     522:	2929                	jal	93c <_free_r>
     524:	14842583          	lw	a1,328(s0)
     528:	14c40493          	addi	s1,s0,332
     52c:	e1b9                	bnez	a1,572 <_reclaim_reent+0x76>
     52e:	486c                	lw	a1,84(s0)
     530:	e9a9                	bnez	a1,582 <_reclaim_reent+0x86>
     532:	5c1c                	lw	a5,56(s0)
     534:	cbb1                	beqz	a5,588 <_reclaim_reent+0x8c>
     536:	5c5c                	lw	a5,60(s0)
     538:	8522                	mv	a0,s0
     53a:	9782                	jalr	a5
     53c:	2e042583          	lw	a1,736(s0)
     540:	c5a1                	beqz	a1,588 <_reclaim_reent+0x8c>
     542:	8522                	mv	a0,s0
     544:	4462                	lw	s0,24(sp)
     546:	40f2                	lw	ra,28(sp)
     548:	44d2                	lw	s1,20(sp)
     54a:	4942                	lw	s2,16(sp)
     54c:	49b2                	lw	s3,12(sp)
     54e:	6105                	addi	sp,sp,32
     550:	b771                	j	4dc <cleanup_glue>
     552:	95a6                	add	a1,a1,s1
     554:	418c                	lw	a1,0(a1)
     556:	e981                	bnez	a1,566 <_reclaim_reent+0x6a>
     558:	0491                	addi	s1,s1,4
     55a:	446c                	lw	a1,76(s0)
     55c:	ff249be3          	bne	s1,s2,552 <_reclaim_reent+0x56>
     560:	8522                	mv	a0,s0
     562:	2ee9                	jal	93c <_free_r>
     564:	bf65                	j	51c <_reclaim_reent+0x20>
     566:	0005a983          	lw	s3,0(a1)
     56a:	8522                	mv	a0,s0
     56c:	2ec1                	jal	93c <_free_r>
     56e:	85ce                	mv	a1,s3
     570:	b7dd                	j	556 <_reclaim_reent+0x5a>
     572:	fa958ee3          	beq	a1,s1,52e <_reclaim_reent+0x32>
     576:	0005a903          	lw	s2,0(a1)
     57a:	8522                	mv	a0,s0
     57c:	26c1                	jal	93c <_free_r>
     57e:	85ca                	mv	a1,s2
     580:	bfcd                	j	572 <_reclaim_reent+0x76>
     582:	8522                	mv	a0,s0
     584:	2e65                	jal	93c <_free_r>
     586:	b775                	j	532 <_reclaim_reent+0x36>
     588:	40f2                	lw	ra,28(sp)
     58a:	4462                	lw	s0,24(sp)
     58c:	44d2                	lw	s1,20(sp)
     58e:	4942                	lw	s2,16(sp)
     590:	49b2                	lw	s3,12(sp)
     592:	6105                	addi	sp,sp,32
     594:	8082                	ret
     596:	8082                	ret

00000598 <strlen>:
     598:	87aa                	mv	a5,a0
     59a:	0785                	addi	a5,a5,1
     59c:	fff7c703          	lbu	a4,-1(a5) # ffffdfff <_sp+0xffffb0af>
     5a0:	ff6d                	bnez	a4,59a <strlen+0x2>
     5a2:	40a78533          	sub	a0,a5,a0
     5a6:	157d                	addi	a0,a0,-1
     5a8:	8082                	ret

000005aa <__register_exitproc>:
     5aa:	0301a703          	lw	a4,48(gp) # 2700 <_global_impure_ptr>
     5ae:	832a                	mv	t1,a0
     5b0:	14872783          	lw	a5,328(a4)
     5b4:	e789                	bnez	a5,5be <__register_exitproc+0x14>
     5b6:	14c70793          	addi	a5,a4,332
     5ba:	14f72423          	sw	a5,328(a4)
     5be:	43d8                	lw	a4,4(a5)
     5c0:	487d                	li	a6,31
     5c2:	557d                	li	a0,-1
     5c4:	04e84263          	blt	a6,a4,608 <__register_exitproc+0x5e>
     5c8:	00271893          	slli	a7,a4,0x2
     5cc:	02030963          	beqz	t1,5fe <__register_exitproc+0x54>
     5d0:	01178533          	add	a0,a5,a7
     5d4:	08c52423          	sw	a2,136(a0)
     5d8:	1887a803          	lw	a6,392(a5)
     5dc:	4605                	li	a2,1
     5de:	00e61633          	sll	a2,a2,a4
     5e2:	00c86833          	or	a6,a6,a2
     5e6:	1907a423          	sw	a6,392(a5)
     5ea:	10d52423          	sw	a3,264(a0)
     5ee:	4689                	li	a3,2
     5f0:	00d31763          	bne	t1,a3,5fe <__register_exitproc+0x54>
     5f4:	18c7a683          	lw	a3,396(a5)
     5f8:	8e55                	or	a2,a2,a3
     5fa:	18c7a623          	sw	a2,396(a5)
     5fe:	0705                	addi	a4,a4,1
     600:	c3d8                	sw	a4,4(a5)
     602:	97c6                	add	a5,a5,a7
     604:	c78c                	sw	a1,8(a5)
     606:	4501                	li	a0,0
     608:	8082                	ret

0000060a <__call_exitprocs>:
     60a:	7179                	addi	sp,sp,-48
     60c:	ce4e                	sw	s3,28(sp)
     60e:	0301a983          	lw	s3,48(gp) # 2700 <_global_impure_ptr>
     612:	cc52                	sw	s4,24(sp)
     614:	ca56                	sw	s5,20(sp)
     616:	c85a                	sw	s6,16(sp)
     618:	d606                	sw	ra,44(sp)
     61a:	d422                	sw	s0,40(sp)
     61c:	d226                	sw	s1,36(sp)
     61e:	d04a                	sw	s2,32(sp)
     620:	c65e                	sw	s7,12(sp)
     622:	8aaa                	mv	s5,a0
     624:	8a2e                	mv	s4,a1
     626:	4b05                	li	s6,1
     628:	1489a483          	lw	s1,328(s3)
     62c:	c881                	beqz	s1,63c <__call_exitprocs+0x32>
     62e:	40c0                	lw	s0,4(s1)
     630:	fff40913          	addi	s2,s0,-1
     634:	040a                	slli	s0,s0,0x2
     636:	9426                	add	s0,s0,s1
     638:	00095d63          	bgez	s2,652 <__call_exitprocs+0x48>
     63c:	50b2                	lw	ra,44(sp)
     63e:	5422                	lw	s0,40(sp)
     640:	5492                	lw	s1,36(sp)
     642:	5902                	lw	s2,32(sp)
     644:	49f2                	lw	s3,28(sp)
     646:	4a62                	lw	s4,24(sp)
     648:	4ad2                	lw	s5,20(sp)
     64a:	4b42                	lw	s6,16(sp)
     64c:	4bb2                	lw	s7,12(sp)
     64e:	6145                	addi	sp,sp,48
     650:	8082                	ret
     652:	000a0963          	beqz	s4,664 <__call_exitprocs+0x5a>
     656:	10442783          	lw	a5,260(s0)
     65a:	01478563          	beq	a5,s4,664 <__call_exitprocs+0x5a>
     65e:	197d                	addi	s2,s2,-1
     660:	1471                	addi	s0,s0,-4
     662:	bfd9                	j	638 <__call_exitprocs+0x2e>
     664:	40d8                	lw	a4,4(s1)
     666:	405c                	lw	a5,4(s0)
     668:	177d                	addi	a4,a4,-1
     66a:	03271663          	bne	a4,s2,696 <__call_exitprocs+0x8c>
     66e:	0124a223          	sw	s2,4(s1)
     672:	d7f5                	beqz	a5,65e <__call_exitprocs+0x54>
     674:	1884a683          	lw	a3,392(s1)
     678:	012b1733          	sll	a4,s6,s2
     67c:	0044ab83          	lw	s7,4(s1)
     680:	8ef9                	and	a3,a3,a4
     682:	ee89                	bnez	a3,69c <__call_exitprocs+0x92>
     684:	9782                	jalr	a5
     686:	40dc                	lw	a5,4(s1)
     688:	fb7790e3          	bne	a5,s7,628 <__call_exitprocs+0x1e>
     68c:	1489a783          	lw	a5,328(s3)
     690:	fc9787e3          	beq	a5,s1,65e <__call_exitprocs+0x54>
     694:	bf51                	j	628 <__call_exitprocs+0x1e>
     696:	00042223          	sw	zero,4(s0)
     69a:	bfe1                	j	672 <__call_exitprocs+0x68>
     69c:	18c4a683          	lw	a3,396(s1)
     6a0:	08442583          	lw	a1,132(s0)
     6a4:	8f75                	and	a4,a4,a3
     6a6:	e701                	bnez	a4,6ae <__call_exitprocs+0xa4>
     6a8:	8556                	mv	a0,s5
     6aa:	9782                	jalr	a5
     6ac:	bfe9                	j	686 <__call_exitprocs+0x7c>
     6ae:	852e                	mv	a0,a1
     6b0:	9782                	jalr	a5
     6b2:	bfd1                	j	686 <__call_exitprocs+0x7c>

000006b4 <__fp_lock>:
     6b4:	4501                	li	a0,0
     6b6:	8082                	ret

000006b8 <std>:
     6b8:	1141                	addi	sp,sp,-16
     6ba:	c422                	sw	s0,8(sp)
     6bc:	c606                	sw	ra,12(sp)
     6be:	842a                	mv	s0,a0
     6c0:	00b51623          	sh	a1,12(a0)
     6c4:	00c51723          	sh	a2,14(a0)
     6c8:	00052023          	sw	zero,0(a0)
     6cc:	00052223          	sw	zero,4(a0)
     6d0:	00052423          	sw	zero,8(a0)
     6d4:	06052223          	sw	zero,100(a0)
     6d8:	00052823          	sw	zero,16(a0)
     6dc:	00052a23          	sw	zero,20(a0)
     6e0:	00052c23          	sw	zero,24(a0)
     6e4:	4621                	li	a2,8
     6e6:	4581                	li	a1,0
     6e8:	05c50513          	addi	a0,a0,92
     6ec:	39c1                	jal	3bc <memset>
     6ee:	000017b7          	lui	a5,0x1
     6f2:	7fc78793          	addi	a5,a5,2044 # 17fc <__sread>
     6f6:	d01c                	sw	a5,32(s0)
     6f8:	000027b7          	lui	a5,0x2
     6fc:	83078793          	addi	a5,a5,-2000 # 1830 <__swrite>
     700:	d05c                	sw	a5,36(s0)
     702:	000027b7          	lui	a5,0x2
     706:	87e78793          	addi	a5,a5,-1922 # 187e <__sseek>
     70a:	d41c                	sw	a5,40(s0)
     70c:	000027b7          	lui	a5,0x2
     710:	8b478793          	addi	a5,a5,-1868 # 18b4 <__sclose>
     714:	cc40                	sw	s0,28(s0)
     716:	d45c                	sw	a5,44(s0)
     718:	40b2                	lw	ra,12(sp)
     71a:	4422                	lw	s0,8(sp)
     71c:	0141                	addi	sp,sp,16
     71e:	8082                	ret

00000720 <_cleanup_r>:
     720:	000025b7          	lui	a1,0x2
     724:	9ee58593          	addi	a1,a1,-1554 # 19ee <_fclose_r>
     728:	a5f5                	j	e14 <_fwalk_reent>

0000072a <__fp_unlock>:
     72a:	4501                	li	a0,0
     72c:	8082                	ret

0000072e <__sfmoreglue>:
     72e:	1141                	addi	sp,sp,-16
     730:	c226                	sw	s1,4(sp)
     732:	06800613          	li	a2,104
     736:	fff58493          	addi	s1,a1,-1
     73a:	02c484b3          	mul	s1,s1,a2
     73e:	c04a                	sw	s2,0(sp)
     740:	892e                	mv	s2,a1
     742:	c422                	sw	s0,8(sp)
     744:	c606                	sw	ra,12(sp)
     746:	07448593          	addi	a1,s1,116
     74a:	736000ef          	jal	ra,e80 <_malloc_r>
     74e:	842a                	mv	s0,a0
     750:	c919                	beqz	a0,766 <__sfmoreglue+0x38>
     752:	00052023          	sw	zero,0(a0)
     756:	01252223          	sw	s2,4(a0)
     75a:	0531                	addi	a0,a0,12
     75c:	c408                	sw	a0,8(s0)
     75e:	06848613          	addi	a2,s1,104
     762:	4581                	li	a1,0
     764:	39a1                	jal	3bc <memset>
     766:	8522                	mv	a0,s0
     768:	40b2                	lw	ra,12(sp)
     76a:	4422                	lw	s0,8(sp)
     76c:	4492                	lw	s1,4(sp)
     76e:	4902                	lw	s2,0(sp)
     770:	0141                	addi	sp,sp,16
     772:	8082                	ret

00000774 <_cleanup>:
     774:	0301a503          	lw	a0,48(gp) # 2700 <_global_impure_ptr>
     778:	b765                	j	720 <_cleanup_r>

0000077a <__sinit>:
     77a:	5d1c                	lw	a5,56(a0)
     77c:	e7a9                	bnez	a5,7c6 <__sinit+0x4c>
     77e:	1141                	addi	sp,sp,-16
     780:	000007b7          	lui	a5,0x0
     784:	c606                	sw	ra,12(sp)
     786:	c422                	sw	s0,8(sp)
     788:	72078793          	addi	a5,a5,1824 # 720 <_cleanup_r>
     78c:	dd5c                	sw	a5,60(a0)
     78e:	478d                	li	a5,3
     790:	2ef52223          	sw	a5,740(a0)
     794:	2ec50793          	addi	a5,a0,748
     798:	842a                	mv	s0,a0
     79a:	2ef52423          	sw	a5,744(a0)
     79e:	2e052023          	sw	zero,736(a0)
     7a2:	4148                	lw	a0,4(a0)
     7a4:	4601                	li	a2,0
     7a6:	4591                	li	a1,4
     7a8:	3f01                	jal	6b8 <std>
     7aa:	4408                	lw	a0,8(s0)
     7ac:	4605                	li	a2,1
     7ae:	45a5                	li	a1,9
     7b0:	3721                	jal	6b8 <std>
     7b2:	4448                	lw	a0,12(s0)
     7b4:	4609                	li	a2,2
     7b6:	45c9                	li	a1,18
     7b8:	3701                	jal	6b8 <std>
     7ba:	4785                	li	a5,1
     7bc:	dc1c                	sw	a5,56(s0)
     7be:	40b2                	lw	ra,12(sp)
     7c0:	4422                	lw	s0,8(sp)
     7c2:	0141                	addi	sp,sp,16
     7c4:	8082                	ret
     7c6:	8082                	ret

000007c8 <__sfp>:
     7c8:	1141                	addi	sp,sp,-16
     7ca:	c226                	sw	s1,4(sp)
     7cc:	0301a483          	lw	s1,48(gp) # 2700 <_global_impure_ptr>
     7d0:	c04a                	sw	s2,0(sp)
     7d2:	c606                	sw	ra,12(sp)
     7d4:	5c9c                	lw	a5,56(s1)
     7d6:	c422                	sw	s0,8(sp)
     7d8:	892a                	mv	s2,a0
     7da:	e399                	bnez	a5,7e0 <__sfp+0x18>
     7dc:	8526                	mv	a0,s1
     7de:	3f71                	jal	77a <__sinit>
     7e0:	2e048493          	addi	s1,s1,736
     7e4:	4480                	lw	s0,8(s1)
     7e6:	40dc                	lw	a5,4(s1)
     7e8:	17fd                	addi	a5,a5,-1
     7ea:	0007d663          	bgez	a5,7f6 <__sfp+0x2e>
     7ee:	409c                	lw	a5,0(s1)
     7f0:	cfb1                	beqz	a5,84c <__sfp+0x84>
     7f2:	4084                	lw	s1,0(s1)
     7f4:	bfc5                	j	7e4 <__sfp+0x1c>
     7f6:	00c41703          	lh	a4,12(s0)
     7fa:	e731                	bnez	a4,846 <__sfp+0x7e>
     7fc:	77c1                	lui	a5,0xffff0
     7fe:	0785                	addi	a5,a5,1
     800:	06042223          	sw	zero,100(s0)
     804:	00042023          	sw	zero,0(s0)
     808:	00042223          	sw	zero,4(s0)
     80c:	00042423          	sw	zero,8(s0)
     810:	c45c                	sw	a5,12(s0)
     812:	00042823          	sw	zero,16(s0)
     816:	00042a23          	sw	zero,20(s0)
     81a:	00042c23          	sw	zero,24(s0)
     81e:	4621                	li	a2,8
     820:	4581                	li	a1,0
     822:	05c40513          	addi	a0,s0,92
     826:	3e59                	jal	3bc <memset>
     828:	02042823          	sw	zero,48(s0)
     82c:	02042a23          	sw	zero,52(s0)
     830:	04042223          	sw	zero,68(s0)
     834:	04042423          	sw	zero,72(s0)
     838:	8522                	mv	a0,s0
     83a:	40b2                	lw	ra,12(sp)
     83c:	4422                	lw	s0,8(sp)
     83e:	4492                	lw	s1,4(sp)
     840:	4902                	lw	s2,0(sp)
     842:	0141                	addi	sp,sp,16
     844:	8082                	ret
     846:	06840413          	addi	s0,s0,104
     84a:	bf79                	j	7e8 <__sfp+0x20>
     84c:	4591                	li	a1,4
     84e:	854a                	mv	a0,s2
     850:	3df9                	jal	72e <__sfmoreglue>
     852:	c088                	sw	a0,0(s1)
     854:	fd59                	bnez	a0,7f2 <__sfp+0x2a>
     856:	47b1                	li	a5,12
     858:	00f92023          	sw	a5,0(s2)
     85c:	4401                	li	s0,0
     85e:	bfe9                	j	838 <__sfp+0x70>

00000860 <__sfp_lock_acquire>:
     860:	8082                	ret

00000862 <__sfp_lock_release>:
     862:	8082                	ret

00000864 <__sinit_lock_acquire>:
     864:	8082                	ret

00000866 <__sinit_lock_release>:
     866:	8082                	ret

00000868 <__fp_lock_all>:
     868:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
     86c:	000005b7          	lui	a1,0x0
     870:	6b458593          	addi	a1,a1,1716 # 6b4 <__fp_lock>
     874:	ab3d                	j	db2 <_fwalk>

00000876 <__fp_unlock_all>:
     876:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
     87a:	000005b7          	lui	a1,0x0
     87e:	72a58593          	addi	a1,a1,1834 # 72a <__fp_unlock>
     882:	ab05                	j	db2 <_fwalk>

00000884 <_malloc_trim_r>:
     884:	1101                	addi	sp,sp,-32
     886:	c84a                	sw	s2,16(sp)
     888:	cc22                	sw	s0,24(sp)
     88a:	ca26                	sw	s1,20(sp)
     88c:	c64e                	sw	s3,12(sp)
     88e:	842e                	mv	s0,a1
     890:	ce06                	sw	ra,28(sp)
     892:	89aa                	mv	s3,a0
     894:	c2818913          	addi	s2,gp,-984 # 22f8 <__malloc_av_>
     898:	3a7000ef          	jal	ra,143e <__malloc_lock>
     89c:	00892783          	lw	a5,8(s2)
     8a0:	6705                	lui	a4,0x1
     8a2:	43c4                	lw	s1,4(a5)
     8a4:	fef70793          	addi	a5,a4,-17 # fef <_malloc_r+0x16f>
     8a8:	40878433          	sub	s0,a5,s0
     8ac:	98f1                	andi	s1,s1,-4
     8ae:	9426                	add	s0,s0,s1
     8b0:	8031                	srli	s0,s0,0xc
     8b2:	147d                	addi	s0,s0,-1
     8b4:	0432                	slli	s0,s0,0xc
     8b6:	00e45d63          	bge	s0,a4,8d0 <_malloc_trim_r+0x4c>
     8ba:	854e                	mv	a0,s3
     8bc:	385000ef          	jal	ra,1440 <__malloc_unlock>
     8c0:	4501                	li	a0,0
     8c2:	40f2                	lw	ra,28(sp)
     8c4:	4462                	lw	s0,24(sp)
     8c6:	44d2                	lw	s1,20(sp)
     8c8:	4942                	lw	s2,16(sp)
     8ca:	49b2                	lw	s3,12(sp)
     8cc:	6105                	addi	sp,sp,32
     8ce:	8082                	ret
     8d0:	4581                	li	a1,0
     8d2:	854e                	mv	a0,s3
     8d4:	6fd000ef          	jal	ra,17d0 <_sbrk_r>
     8d8:	00892783          	lw	a5,8(s2)
     8dc:	97a6                	add	a5,a5,s1
     8de:	fcf51ee3          	bne	a0,a5,8ba <_malloc_trim_r+0x36>
     8e2:	408005b3          	neg	a1,s0
     8e6:	854e                	mv	a0,s3
     8e8:	6e9000ef          	jal	ra,17d0 <_sbrk_r>
     8ec:	57fd                	li	a5,-1
     8ee:	02f51663          	bne	a0,a5,91a <_malloc_trim_r+0x96>
     8f2:	4581                	li	a1,0
     8f4:	854e                	mv	a0,s3
     8f6:	6db000ef          	jal	ra,17d0 <_sbrk_r>
     8fa:	00892703          	lw	a4,8(s2)
     8fe:	46bd                	li	a3,15
     900:	40e507b3          	sub	a5,a0,a4
     904:	faf6dbe3          	bge	a3,a5,8ba <_malloc_trim_r+0x36>
     908:	03c1a683          	lw	a3,60(gp) # 270c <__malloc_sbrk_base>
     90c:	0017e793          	ori	a5,a5,1
     910:	c35c                	sw	a5,4(a4)
     912:	8d15                	sub	a0,a0,a3
     914:	04a1a823          	sw	a0,80(gp) # 2720 <__malloc_current_mallinfo>
     918:	b74d                	j	8ba <_malloc_trim_r+0x36>
     91a:	00892783          	lw	a5,8(s2)
     91e:	8c81                	sub	s1,s1,s0
     920:	0014e493          	ori	s1,s1,1
     924:	c3c4                	sw	s1,4(a5)
     926:	0501a783          	lw	a5,80(gp) # 2720 <__malloc_current_mallinfo>
     92a:	854e                	mv	a0,s3
     92c:	40878433          	sub	s0,a5,s0
     930:	0481a823          	sw	s0,80(gp) # 2720 <__malloc_current_mallinfo>
     934:	30d000ef          	jal	ra,1440 <__malloc_unlock>
     938:	4505                	li	a0,1
     93a:	b761                	j	8c2 <_malloc_trim_r+0x3e>

0000093c <_free_r>:
     93c:	18058e63          	beqz	a1,ad8 <_free_r+0x19c>
     940:	1141                	addi	sp,sp,-16
     942:	c422                	sw	s0,8(sp)
     944:	c226                	sw	s1,4(sp)
     946:	842a                	mv	s0,a0
     948:	84ae                	mv	s1,a1
     94a:	c606                	sw	ra,12(sp)
     94c:	2f3000ef          	jal	ra,143e <__malloc_lock>
     950:	ffc4a503          	lw	a0,-4(s1)
     954:	ff848693          	addi	a3,s1,-8
     958:	ffe57793          	andi	a5,a0,-2
     95c:	c2818813          	addi	a6,gp,-984 # 22f8 <__malloc_av_>
     960:	00f685b3          	add	a1,a3,a5
     964:	41d8                	lw	a4,4(a1)
     966:	00882803          	lw	a6,8(a6)
     96a:	c2818613          	addi	a2,gp,-984 # 22f8 <__malloc_av_>
     96e:	9b71                	andi	a4,a4,-4
     970:	8905                	andi	a0,a0,1
     972:	02b81f63          	bne	a6,a1,9b0 <_free_r+0x74>
     976:	97ba                	add	a5,a5,a4
     978:	e909                	bnez	a0,98a <_free_r+0x4e>
     97a:	ff84a703          	lw	a4,-8(s1)
     97e:	8e99                	sub	a3,a3,a4
     980:	468c                	lw	a1,8(a3)
     982:	97ba                	add	a5,a5,a4
     984:	46d8                	lw	a4,12(a3)
     986:	c5d8                	sw	a4,12(a1)
     988:	c70c                	sw	a1,8(a4)
     98a:	0017e713          	ori	a4,a5,1
     98e:	c2d8                	sw	a4,4(a3)
     990:	0401a703          	lw	a4,64(gp) # 2710 <__malloc_trim_threshold>
     994:	c614                	sw	a3,8(a2)
     996:	00e7e663          	bltu	a5,a4,9a2 <_free_r+0x66>
     99a:	04c1a583          	lw	a1,76(gp) # 271c <__malloc_top_pad>
     99e:	8522                	mv	a0,s0
     9a0:	35d5                	jal	884 <_malloc_trim_r>
     9a2:	8522                	mv	a0,s0
     9a4:	4422                	lw	s0,8(sp)
     9a6:	40b2                	lw	ra,12(sp)
     9a8:	4492                	lw	s1,4(sp)
     9aa:	0141                	addi	sp,sp,16
     9ac:	2950006f          	j	1440 <__malloc_unlock>
     9b0:	c1d8                	sw	a4,4(a1)
     9b2:	4801                	li	a6,0
     9b4:	e105                	bnez	a0,9d4 <_free_r+0x98>
     9b6:	ff84a503          	lw	a0,-8(s1)
     9ba:	c3018893          	addi	a7,gp,-976 # 2300 <__malloc_av_+0x8>
     9be:	8e89                	sub	a3,a3,a0
     9c0:	97aa                	add	a5,a5,a0
     9c2:	4688                	lw	a0,8(a3)
     9c4:	07150a63          	beq	a0,a7,a38 <_free_r+0xfc>
     9c8:	00c6a883          	lw	a7,12(a3) # 200c <__DATA_BEGIN__+0x13c>
     9cc:	01152623          	sw	a7,12(a0)
     9d0:	00a8a423          	sw	a0,8(a7)
     9d4:	00e58533          	add	a0,a1,a4
     9d8:	4148                	lw	a0,4(a0)
     9da:	8905                	andi	a0,a0,1
     9dc:	ed11                	bnez	a0,9f8 <_free_r+0xbc>
     9de:	97ba                	add	a5,a5,a4
     9e0:	4598                	lw	a4,8(a1)
     9e2:	04081d63          	bnez	a6,a3c <_free_r+0x100>
     9e6:	c3018513          	addi	a0,gp,-976 # 2300 <__malloc_av_+0x8>
     9ea:	04a71963          	bne	a4,a0,a3c <_free_r+0x100>
     9ee:	ca54                	sw	a3,20(a2)
     9f0:	ca14                	sw	a3,16(a2)
     9f2:	c6d8                	sw	a4,12(a3)
     9f4:	c698                	sw	a4,8(a3)
     9f6:	4805                	li	a6,1
     9f8:	0017e713          	ori	a4,a5,1
     9fc:	c2d8                	sw	a4,4(a3)
     9fe:	00f68733          	add	a4,a3,a5
     a02:	c31c                	sw	a5,0(a4)
     a04:	f8081fe3          	bnez	a6,9a2 <_free_r+0x66>
     a08:	1ff00713          	li	a4,511
     a0c:	02f76c63          	bltu	a4,a5,a44 <_free_r+0x108>
     a10:	838d                	srli	a5,a5,0x3
     a12:	4027d593          	srai	a1,a5,0x2
     a16:	4705                	li	a4,1
     a18:	00b71733          	sll	a4,a4,a1
     a1c:	424c                	lw	a1,4(a2)
     a1e:	0785                	addi	a5,a5,1
     a20:	078e                	slli	a5,a5,0x3
     a22:	97b2                	add	a5,a5,a2
     a24:	8f4d                	or	a4,a4,a1
     a26:	c258                	sw	a4,4(a2)
     a28:	4398                	lw	a4,0(a5)
     a2a:	ff878613          	addi	a2,a5,-8 # fffefff8 <_sp+0xfffed0a8>
     a2e:	c6d0                	sw	a2,12(a3)
     a30:	c698                	sw	a4,8(a3)
     a32:	c394                	sw	a3,0(a5)
     a34:	c754                	sw	a3,12(a4)
     a36:	b7b5                	j	9a2 <_free_r+0x66>
     a38:	4805                	li	a6,1
     a3a:	bf69                	j	9d4 <_free_r+0x98>
     a3c:	45cc                	lw	a1,12(a1)
     a3e:	c74c                	sw	a1,12(a4)
     a40:	c598                	sw	a4,8(a1)
     a42:	bf5d                	j	9f8 <_free_r+0xbc>
     a44:	0097d593          	srli	a1,a5,0x9
     a48:	4711                	li	a4,4
     a4a:	02b76b63          	bltu	a4,a1,a80 <_free_r+0x144>
     a4e:	0067d713          	srli	a4,a5,0x6
     a52:	03870713          	addi	a4,a4,56
     a56:	00170593          	addi	a1,a4,1
     a5a:	058e                	slli	a1,a1,0x3
     a5c:	95b2                	add	a1,a1,a2
     a5e:	ff858513          	addi	a0,a1,-8
     a62:	418c                	lw	a1,0(a1)
     a64:	06b51463          	bne	a0,a1,acc <_free_r+0x190>
     a68:	4785                	li	a5,1
     a6a:	8709                	srai	a4,a4,0x2
     a6c:	00e79733          	sll	a4,a5,a4
     a70:	425c                	lw	a5,4(a2)
     a72:	8f5d                	or	a4,a4,a5
     a74:	c258                	sw	a4,4(a2)
     a76:	c6c8                	sw	a0,12(a3)
     a78:	c68c                	sw	a1,8(a3)
     a7a:	c514                	sw	a3,8(a0)
     a7c:	c5d4                	sw	a3,12(a1)
     a7e:	b715                	j	9a2 <_free_r+0x66>
     a80:	4751                	li	a4,20
     a82:	00b76563          	bltu	a4,a1,a8c <_free_r+0x150>
     a86:	05b58713          	addi	a4,a1,91
     a8a:	b7f1                	j	a56 <_free_r+0x11a>
     a8c:	05400713          	li	a4,84
     a90:	00b76763          	bltu	a4,a1,a9e <_free_r+0x162>
     a94:	00c7d713          	srli	a4,a5,0xc
     a98:	06e70713          	addi	a4,a4,110
     a9c:	bf6d                	j	a56 <_free_r+0x11a>
     a9e:	15400713          	li	a4,340
     aa2:	00b76763          	bltu	a4,a1,ab0 <_free_r+0x174>
     aa6:	00f7d713          	srli	a4,a5,0xf
     aaa:	07770713          	addi	a4,a4,119
     aae:	b765                	j	a56 <_free_r+0x11a>
     ab0:	55400513          	li	a0,1364
     ab4:	07e00713          	li	a4,126
     ab8:	f8b56fe3          	bltu	a0,a1,a56 <_free_r+0x11a>
     abc:	0127d713          	srli	a4,a5,0x12
     ac0:	07c70713          	addi	a4,a4,124
     ac4:	bf49                	j	a56 <_free_r+0x11a>
     ac6:	458c                	lw	a1,8(a1)
     ac8:	00b50663          	beq	a0,a1,ad4 <_free_r+0x198>
     acc:	41d8                	lw	a4,4(a1)
     ace:	9b71                	andi	a4,a4,-4
     ad0:	fee7ebe3          	bltu	a5,a4,ac6 <_free_r+0x18a>
     ad4:	45c8                	lw	a0,12(a1)
     ad6:	b745                	j	a76 <_free_r+0x13a>
     ad8:	8082                	ret

00000ada <__sfvwrite_r>:
     ada:	461c                	lw	a5,8(a2)
     adc:	e781                	bnez	a5,ae4 <__sfvwrite_r+0xa>
     ade:	4781                	li	a5,0
     ae0:	853e                	mv	a0,a5
     ae2:	8082                	ret
     ae4:	00c5d783          	lhu	a5,12(a1)
     ae8:	715d                	addi	sp,sp,-80
     aea:	c4a2                	sw	s0,72(sp)
     aec:	c0ca                	sw	s2,64(sp)
     aee:	da56                	sw	s5,52(sp)
     af0:	c686                	sw	ra,76(sp)
     af2:	c2a6                	sw	s1,68(sp)
     af4:	de4e                	sw	s3,60(sp)
     af6:	dc52                	sw	s4,56(sp)
     af8:	d85a                	sw	s6,48(sp)
     afa:	d65e                	sw	s7,44(sp)
     afc:	d462                	sw	s8,40(sp)
     afe:	d266                	sw	s9,36(sp)
     b00:	d06a                	sw	s10,32(sp)
     b02:	ce6e                	sw	s11,28(sp)
     b04:	8ba1                	andi	a5,a5,8
     b06:	8ab2                	mv	s5,a2
     b08:	842e                	mv	s0,a1
     b0a:	892a                	mv	s2,a0
     b0c:	cfd9                	beqz	a5,baa <__sfvwrite_r+0xd0>
     b0e:	499c                	lw	a5,16(a1)
     b10:	cfc9                	beqz	a5,baa <__sfvwrite_r+0xd0>
     b12:	00c45783          	lhu	a5,12(s0)
     b16:	000aaa03          	lw	s4,0(s5)
     b1a:	0027f713          	andi	a4,a5,2
     b1e:	0e071863          	bnez	a4,c0e <__sfvwrite_r+0x134>
     b22:	8b85                	andi	a5,a5,1
     b24:	16078063          	beqz	a5,c84 <__sfvwrite_r+0x1aa>
     b28:	4b81                	li	s7,0
     b2a:	4501                	li	a0,0
     b2c:	4b01                	li	s6,0
     b2e:	4981                	li	s3,0
     b30:	24098363          	beqz	s3,d76 <__sfvwrite_r+0x29c>
     b34:	ed01                	bnez	a0,b4c <__sfvwrite_r+0x72>
     b36:	864e                	mv	a2,s3
     b38:	45a9                	li	a1,10
     b3a:	855a                	mv	a0,s6
     b3c:	7e8000ef          	jal	ra,1324 <memchr>
     b40:	00198b93          	addi	s7,s3,1
     b44:	c501                	beqz	a0,b4c <__sfvwrite_r+0x72>
     b46:	0505                	addi	a0,a0,1
     b48:	41650bb3          	sub	s7,a0,s6
     b4c:	8c5e                	mv	s8,s7
     b4e:	0179f363          	bgeu	s3,s7,b54 <__sfvwrite_r+0x7a>
     b52:	8c4e                	mv	s8,s3
     b54:	4008                	lw	a0,0(s0)
     b56:	481c                	lw	a5,16(s0)
     b58:	4854                	lw	a3,20(s0)
     b5a:	22a7f563          	bgeu	a5,a0,d84 <__sfvwrite_r+0x2aa>
     b5e:	4404                	lw	s1,8(s0)
     b60:	94b6                	add	s1,s1,a3
     b62:	2384d163          	bge	s1,s8,d84 <__sfvwrite_r+0x2aa>
     b66:	85da                	mv	a1,s6
     b68:	8626                	mv	a2,s1
     b6a:	08b000ef          	jal	ra,13f4 <memmove>
     b6e:	401c                	lw	a5,0(s0)
     b70:	85a2                	mv	a1,s0
     b72:	854a                	mv	a0,s2
     b74:	97a6                	add	a5,a5,s1
     b76:	c01c                	sw	a5,0(s0)
     b78:	066010ef          	jal	ra,1bde <_fflush_r>
     b7c:	0e051c63          	bnez	a0,c74 <__sfvwrite_r+0x19a>
     b80:	409b8bb3          	sub	s7,s7,s1
     b84:	4505                	li	a0,1
     b86:	000b9763          	bnez	s7,b94 <__sfvwrite_r+0xba>
     b8a:	85a2                	mv	a1,s0
     b8c:	854a                	mv	a0,s2
     b8e:	050010ef          	jal	ra,1bde <_fflush_r>
     b92:	e16d                	bnez	a0,c74 <__sfvwrite_r+0x19a>
     b94:	008aa783          	lw	a5,8(s5)
     b98:	9b26                	add	s6,s6,s1
     b9a:	409989b3          	sub	s3,s3,s1
     b9e:	409784b3          	sub	s1,a5,s1
     ba2:	009aa423          	sw	s1,8(s5)
     ba6:	f4c9                	bnez	s1,b30 <__sfvwrite_r+0x56>
     ba8:	a091                	j	bec <__sfvwrite_r+0x112>
     baa:	85a2                	mv	a1,s0
     bac:	854a                	mv	a0,s2
     bae:	53d000ef          	jal	ra,18ea <__swsetup_r>
     bb2:	57fd                	li	a5,-1
     bb4:	dd39                	beqz	a0,b12 <__sfvwrite_r+0x38>
     bb6:	a825                	j	bee <__sfvwrite_r+0x114>
     bb8:	000a2983          	lw	s3,0(s4)
     bbc:	004a2483          	lw	s1,4(s4)
     bc0:	0a21                	addi	s4,s4,8
     bc2:	d8fd                	beqz	s1,bb8 <__sfvwrite_r+0xde>
     bc4:	86a6                	mv	a3,s1
     bc6:	009b7363          	bgeu	s6,s1,bcc <__sfvwrite_r+0xf2>
     bca:	86da                	mv	a3,s6
     bcc:	505c                	lw	a5,36(s0)
     bce:	4c4c                	lw	a1,28(s0)
     bd0:	864e                	mv	a2,s3
     bd2:	854a                	mv	a0,s2
     bd4:	9782                	jalr	a5
     bd6:	08a05f63          	blez	a0,c74 <__sfvwrite_r+0x19a>
     bda:	008aa783          	lw	a5,8(s5)
     bde:	99aa                	add	s3,s3,a0
     be0:	8c89                	sub	s1,s1,a0
     be2:	40a78533          	sub	a0,a5,a0
     be6:	00aaa423          	sw	a0,8(s5)
     bea:	fd61                	bnez	a0,bc2 <__sfvwrite_r+0xe8>
     bec:	4781                	li	a5,0
     bee:	40b6                	lw	ra,76(sp)
     bf0:	4426                	lw	s0,72(sp)
     bf2:	4496                	lw	s1,68(sp)
     bf4:	4906                	lw	s2,64(sp)
     bf6:	59f2                	lw	s3,60(sp)
     bf8:	5a62                	lw	s4,56(sp)
     bfa:	5ad2                	lw	s5,52(sp)
     bfc:	5b42                	lw	s6,48(sp)
     bfe:	5bb2                	lw	s7,44(sp)
     c00:	5c22                	lw	s8,40(sp)
     c02:	5c92                	lw	s9,36(sp)
     c04:	5d02                	lw	s10,32(sp)
     c06:	4df2                	lw	s11,28(sp)
     c08:	853e                	mv	a0,a5
     c0a:	6161                	addi	sp,sp,80
     c0c:	8082                	ret
     c0e:	80000b37          	lui	s6,0x80000
     c12:	4981                	li	s3,0
     c14:	4481                	li	s1,0
     c16:	c00b4b13          	xori	s6,s6,-1024
     c1a:	b765                	j	bc2 <__sfvwrite_r+0xe8>
     c1c:	000a2b03          	lw	s6,0(s4)
     c20:	004a2483          	lw	s1,4(s4)
     c24:	0a21                	addi	s4,s4,8
     c26:	d8fd                	beqz	s1,c1c <__sfvwrite_r+0x142>
     c28:	00c45703          	lhu	a4,12(s0)
     c2c:	441c                	lw	a5,8(s0)
     c2e:	4008                	lw	a0,0(s0)
     c30:	20077693          	andi	a3,a4,512
     c34:	0e068563          	beqz	a3,d1e <__sfvwrite_r+0x244>
     c38:	08f4e863          	bltu	s1,a5,cc8 <__sfvwrite_r+0x1ee>
     c3c:	48077693          	andi	a3,a4,1152
     c40:	c6c1                	beqz	a3,cc8 <__sfvwrite_r+0x1ee>
     c42:	01442d83          	lw	s11,20(s0)
     c46:	480c                	lw	a1,16(s0)
     c48:	03bc8db3          	mul	s11,s9,s11
     c4c:	40b509b3          	sub	s3,a0,a1
     c50:	00198793          	addi	a5,s3,1
     c54:	97a6                	add	a5,a5,s1
     c56:	03adcdb3          	div	s11,s11,s10
     c5a:	00fdf363          	bgeu	s11,a5,c60 <__sfvwrite_r+0x186>
     c5e:	8dbe                	mv	s11,a5
     c60:	40077713          	andi	a4,a4,1024
     c64:	cf51                	beqz	a4,d00 <__sfvwrite_r+0x226>
     c66:	85ee                	mv	a1,s11
     c68:	854a                	mv	a0,s2
     c6a:	2c19                	jal	e80 <_malloc_r>
     c6c:	e51d                	bnez	a0,c9a <__sfvwrite_r+0x1c0>
     c6e:	47b1                	li	a5,12
     c70:	00f92023          	sw	a5,0(s2)
     c74:	00c45783          	lhu	a5,12(s0)
     c78:	0407e793          	ori	a5,a5,64
     c7c:	00f41623          	sh	a5,12(s0)
     c80:	57fd                	li	a5,-1
     c82:	b7b5                	j	bee <__sfvwrite_r+0x114>
     c84:	80000bb7          	lui	s7,0x80000
     c88:	ffebcc13          	xori	s8,s7,-2
     c8c:	4b01                	li	s6,0
     c8e:	4481                	li	s1,0
     c90:	fffbcb93          	not	s7,s7
     c94:	4c8d                	li	s9,3
     c96:	4d09                	li	s10,2
     c98:	b779                	j	c26 <__sfvwrite_r+0x14c>
     c9a:	480c                	lw	a1,16(s0)
     c9c:	864e                	mv	a2,s3
     c9e:	c62a                	sw	a0,12(sp)
     ca0:	2d79                	jal	133e <memcpy>
     ca2:	00c45703          	lhu	a4,12(s0)
     ca6:	47b2                	lw	a5,12(sp)
     ca8:	b7f77713          	andi	a4,a4,-1153
     cac:	08076713          	ori	a4,a4,128
     cb0:	00e41623          	sh	a4,12(s0)
     cb4:	c81c                	sw	a5,16(s0)
     cb6:	01b42a23          	sw	s11,20(s0)
     cba:	97ce                	add	a5,a5,s3
     cbc:	413d8db3          	sub	s11,s11,s3
     cc0:	c01c                	sw	a5,0(s0)
     cc2:	01b42423          	sw	s11,8(s0)
     cc6:	87a6                	mv	a5,s1
     cc8:	89a6                	mv	s3,s1
     cca:	00f4f363          	bgeu	s1,a5,cd0 <__sfvwrite_r+0x1f6>
     cce:	87a6                	mv	a5,s1
     cd0:	4008                	lw	a0,0(s0)
     cd2:	863e                	mv	a2,a5
     cd4:	85da                	mv	a1,s6
     cd6:	c63e                	sw	a5,12(sp)
     cd8:	2f31                	jal	13f4 <memmove>
     cda:	4418                	lw	a4,8(s0)
     cdc:	47b2                	lw	a5,12(sp)
     cde:	8f1d                	sub	a4,a4,a5
     ce0:	c418                	sw	a4,8(s0)
     ce2:	4018                	lw	a4,0(s0)
     ce4:	97ba                	add	a5,a5,a4
     ce6:	c01c                	sw	a5,0(s0)
     ce8:	008aa783          	lw	a5,8(s5)
     cec:	9b4e                	add	s6,s6,s3
     cee:	413484b3          	sub	s1,s1,s3
     cf2:	413789b3          	sub	s3,a5,s3
     cf6:	013aa423          	sw	s3,8(s5)
     cfa:	f20996e3          	bnez	s3,c26 <__sfvwrite_r+0x14c>
     cfe:	b5fd                	j	bec <__sfvwrite_r+0x112>
     d00:	866e                	mv	a2,s11
     d02:	854a                	mv	a0,s2
     d04:	2f3d                	jal	1442 <_realloc_r>
     d06:	87aa                	mv	a5,a0
     d08:	f555                	bnez	a0,cb4 <__sfvwrite_r+0x1da>
     d0a:	480c                	lw	a1,16(s0)
     d0c:	854a                	mv	a0,s2
     d0e:	313d                	jal	93c <_free_r>
     d10:	00c45783          	lhu	a5,12(s0)
     d14:	f7f7f793          	andi	a5,a5,-129
     d18:	00f41623          	sh	a5,12(s0)
     d1c:	bf89                	j	c6e <__sfvwrite_r+0x194>
     d1e:	4818                	lw	a4,16(s0)
     d20:	00a76563          	bltu	a4,a0,d2a <__sfvwrite_r+0x250>
     d24:	4854                	lw	a3,20(s0)
     d26:	02d4f763          	bgeu	s1,a3,d54 <__sfvwrite_r+0x27a>
     d2a:	89be                	mv	s3,a5
     d2c:	00f4f363          	bgeu	s1,a5,d32 <__sfvwrite_r+0x258>
     d30:	89a6                	mv	s3,s1
     d32:	864e                	mv	a2,s3
     d34:	85da                	mv	a1,s6
     d36:	2d7d                	jal	13f4 <memmove>
     d38:	441c                	lw	a5,8(s0)
     d3a:	4018                	lw	a4,0(s0)
     d3c:	413787b3          	sub	a5,a5,s3
     d40:	974e                	add	a4,a4,s3
     d42:	c41c                	sw	a5,8(s0)
     d44:	c018                	sw	a4,0(s0)
     d46:	f3cd                	bnez	a5,ce8 <__sfvwrite_r+0x20e>
     d48:	85a2                	mv	a1,s0
     d4a:	854a                	mv	a0,s2
     d4c:	693000ef          	jal	ra,1bde <_fflush_r>
     d50:	dd41                	beqz	a0,ce8 <__sfvwrite_r+0x20e>
     d52:	b70d                	j	c74 <__sfvwrite_r+0x19a>
     d54:	87a6                	mv	a5,s1
     d56:	009c7363          	bgeu	s8,s1,d5c <__sfvwrite_r+0x282>
     d5a:	87de                	mv	a5,s7
     d5c:	02d7c7b3          	div	a5,a5,a3
     d60:	5058                	lw	a4,36(s0)
     d62:	4c4c                	lw	a1,28(s0)
     d64:	865a                	mv	a2,s6
     d66:	854a                	mv	a0,s2
     d68:	02d786b3          	mul	a3,a5,a3
     d6c:	9702                	jalr	a4
     d6e:	89aa                	mv	s3,a0
     d70:	f6a04ce3          	bgtz	a0,ce8 <__sfvwrite_r+0x20e>
     d74:	b701                	j	c74 <__sfvwrite_r+0x19a>
     d76:	000a2b03          	lw	s6,0(s4)
     d7a:	004a2983          	lw	s3,4(s4)
     d7e:	4501                	li	a0,0
     d80:	0a21                	addi	s4,s4,8
     d82:	b37d                	j	b30 <__sfvwrite_r+0x56>
     d84:	00dc4b63          	blt	s8,a3,d9a <__sfvwrite_r+0x2c0>
     d88:	505c                	lw	a5,36(s0)
     d8a:	4c4c                	lw	a1,28(s0)
     d8c:	865a                	mv	a2,s6
     d8e:	854a                	mv	a0,s2
     d90:	9782                	jalr	a5
     d92:	84aa                	mv	s1,a0
     d94:	dea046e3          	bgtz	a0,b80 <__sfvwrite_r+0xa6>
     d98:	bdf1                	j	c74 <__sfvwrite_r+0x19a>
     d9a:	8662                	mv	a2,s8
     d9c:	85da                	mv	a1,s6
     d9e:	2d99                	jal	13f4 <memmove>
     da0:	441c                	lw	a5,8(s0)
     da2:	84e2                	mv	s1,s8
     da4:	418787b3          	sub	a5,a5,s8
     da8:	c41c                	sw	a5,8(s0)
     daa:	401c                	lw	a5,0(s0)
     dac:	97e2                	add	a5,a5,s8
     dae:	c01c                	sw	a5,0(s0)
     db0:	bbc1                	j	b80 <__sfvwrite_r+0xa6>

00000db2 <_fwalk>:
     db2:	7179                	addi	sp,sp,-48
     db4:	d422                	sw	s0,40(sp)
     db6:	d04a                	sw	s2,32(sp)
     db8:	cc52                	sw	s4,24(sp)
     dba:	ca56                	sw	s5,20(sp)
     dbc:	d606                	sw	ra,44(sp)
     dbe:	d226                	sw	s1,36(sp)
     dc0:	ce4e                	sw	s3,28(sp)
     dc2:	2e050413          	addi	s0,a0,736
     dc6:	4901                	li	s2,0
     dc8:	4a05                	li	s4,1
     dca:	5afd                	li	s5,-1
     dcc:	e819                	bnez	s0,de2 <_fwalk+0x30>
     dce:	50b2                	lw	ra,44(sp)
     dd0:	5422                	lw	s0,40(sp)
     dd2:	854a                	mv	a0,s2
     dd4:	5492                	lw	s1,36(sp)
     dd6:	5902                	lw	s2,32(sp)
     dd8:	49f2                	lw	s3,28(sp)
     dda:	4a62                	lw	s4,24(sp)
     ddc:	4ad2                	lw	s5,20(sp)
     dde:	6145                	addi	sp,sp,48
     de0:	8082                	ret
     de2:	4404                	lw	s1,8(s0)
     de4:	00442983          	lw	s3,4(s0)
     de8:	19fd                	addi	s3,s3,-1
     dea:	0009d463          	bgez	s3,df2 <_fwalk+0x40>
     dee:	4000                	lw	s0,0(s0)
     df0:	bff1                	j	dcc <_fwalk+0x1a>
     df2:	00c4d783          	lhu	a5,12(s1)
     df6:	00fa7c63          	bgeu	s4,a5,e0e <_fwalk+0x5c>
     dfa:	00e49783          	lh	a5,14(s1)
     dfe:	01578863          	beq	a5,s5,e0e <_fwalk+0x5c>
     e02:	8526                	mv	a0,s1
     e04:	c62e                	sw	a1,12(sp)
     e06:	9582                	jalr	a1
     e08:	45b2                	lw	a1,12(sp)
     e0a:	00a96933          	or	s2,s2,a0
     e0e:	06848493          	addi	s1,s1,104
     e12:	bfd9                	j	de8 <_fwalk+0x36>

00000e14 <_fwalk_reent>:
     e14:	7179                	addi	sp,sp,-48
     e16:	d422                	sw	s0,40(sp)
     e18:	d04a                	sw	s2,32(sp)
     e1a:	cc52                	sw	s4,24(sp)
     e1c:	ca56                	sw	s5,20(sp)
     e1e:	c85a                	sw	s6,16(sp)
     e20:	c65e                	sw	s7,12(sp)
     e22:	d606                	sw	ra,44(sp)
     e24:	d226                	sw	s1,36(sp)
     e26:	ce4e                	sw	s3,28(sp)
     e28:	8a2a                	mv	s4,a0
     e2a:	8aae                	mv	s5,a1
     e2c:	2e050413          	addi	s0,a0,736
     e30:	4901                	li	s2,0
     e32:	4b05                	li	s6,1
     e34:	5bfd                	li	s7,-1
     e36:	ec09                	bnez	s0,e50 <_fwalk_reent+0x3c>
     e38:	50b2                	lw	ra,44(sp)
     e3a:	5422                	lw	s0,40(sp)
     e3c:	854a                	mv	a0,s2
     e3e:	5492                	lw	s1,36(sp)
     e40:	5902                	lw	s2,32(sp)
     e42:	49f2                	lw	s3,28(sp)
     e44:	4a62                	lw	s4,24(sp)
     e46:	4ad2                	lw	s5,20(sp)
     e48:	4b42                	lw	s6,16(sp)
     e4a:	4bb2                	lw	s7,12(sp)
     e4c:	6145                	addi	sp,sp,48
     e4e:	8082                	ret
     e50:	4404                	lw	s1,8(s0)
     e52:	00442983          	lw	s3,4(s0)
     e56:	19fd                	addi	s3,s3,-1
     e58:	0009d463          	bgez	s3,e60 <_fwalk_reent+0x4c>
     e5c:	4000                	lw	s0,0(s0)
     e5e:	bfe1                	j	e36 <_fwalk_reent+0x22>
     e60:	00c4d783          	lhu	a5,12(s1)
     e64:	00fb7b63          	bgeu	s6,a5,e7a <_fwalk_reent+0x66>
     e68:	00e49783          	lh	a5,14(s1)
     e6c:	01778763          	beq	a5,s7,e7a <_fwalk_reent+0x66>
     e70:	85a6                	mv	a1,s1
     e72:	8552                	mv	a0,s4
     e74:	9a82                	jalr	s5
     e76:	00a96933          	or	s2,s2,a0
     e7a:	06848493          	addi	s1,s1,104
     e7e:	bfe1                	j	e56 <_fwalk_reent+0x42>

00000e80 <_malloc_r>:
     e80:	7179                	addi	sp,sp,-48
     e82:	d606                	sw	ra,44(sp)
     e84:	d422                	sw	s0,40(sp)
     e86:	d226                	sw	s1,36(sp)
     e88:	d04a                	sw	s2,32(sp)
     e8a:	ce4e                	sw	s3,28(sp)
     e8c:	cc52                	sw	s4,24(sp)
     e8e:	ca56                	sw	s5,20(sp)
     e90:	c85a                	sw	s6,16(sp)
     e92:	c65e                	sw	s7,12(sp)
     e94:	c462                	sw	s8,8(sp)
     e96:	c266                	sw	s9,4(sp)
     e98:	00b58793          	addi	a5,a1,11
     e9c:	4759                	li	a4,22
     e9e:	02f77663          	bgeu	a4,a5,eca <_malloc_r+0x4a>
     ea2:	ff87f493          	andi	s1,a5,-8
     ea6:	0204d363          	bgez	s1,ecc <_malloc_r+0x4c>
     eaa:	47b1                	li	a5,12
     eac:	c11c                	sw	a5,0(a0)
     eae:	4501                	li	a0,0
     eb0:	50b2                	lw	ra,44(sp)
     eb2:	5422                	lw	s0,40(sp)
     eb4:	5492                	lw	s1,36(sp)
     eb6:	5902                	lw	s2,32(sp)
     eb8:	49f2                	lw	s3,28(sp)
     eba:	4a62                	lw	s4,24(sp)
     ebc:	4ad2                	lw	s5,20(sp)
     ebe:	4b42                	lw	s6,16(sp)
     ec0:	4bb2                	lw	s7,12(sp)
     ec2:	4c22                	lw	s8,8(sp)
     ec4:	4c92                	lw	s9,4(sp)
     ec6:	6145                	addi	sp,sp,48
     ec8:	8082                	ret
     eca:	44c1                	li	s1,16
     ecc:	fcb4efe3          	bltu	s1,a1,eaa <_malloc_r+0x2a>
     ed0:	89aa                	mv	s3,a0
     ed2:	23b5                	jal	143e <__malloc_lock>
     ed4:	1f700793          	li	a5,503
     ed8:	c2818913          	addi	s2,gp,-984 # 22f8 <__malloc_av_>
     edc:	0297ec63          	bltu	a5,s1,f14 <_malloc_r+0x94>
     ee0:	00848713          	addi	a4,s1,8
     ee4:	974a                	add	a4,a4,s2
     ee6:	4340                	lw	s0,4(a4)
     ee8:	ff870693          	addi	a3,a4,-8
     eec:	0034d793          	srli	a5,s1,0x3
     ef0:	00d41663          	bne	s0,a3,efc <_malloc_r+0x7c>
     ef4:	4740                	lw	s0,12(a4)
     ef6:	0789                	addi	a5,a5,2
     ef8:	04870c63          	beq	a4,s0,f50 <_malloc_r+0xd0>
     efc:	405c                	lw	a5,4(s0)
     efe:	4458                	lw	a4,12(s0)
     f00:	4414                	lw	a3,8(s0)
     f02:	9bf1                	andi	a5,a5,-4
     f04:	97a2                	add	a5,a5,s0
     f06:	c6d8                	sw	a4,12(a3)
     f08:	c714                	sw	a3,8(a4)
     f0a:	43d8                	lw	a4,4(a5)
     f0c:	00176713          	ori	a4,a4,1
     f10:	c3d8                	sw	a4,4(a5)
     f12:	a8b5                	j	f8e <_malloc_r+0x10e>
     f14:	0094d713          	srli	a4,s1,0x9
     f18:	03f00793          	li	a5,63
     f1c:	cb01                	beqz	a4,f2c <_malloc_r+0xac>
     f1e:	4791                	li	a5,4
     f20:	06e7ec63          	bltu	a5,a4,f98 <_malloc_r+0x118>
     f24:	0064d793          	srli	a5,s1,0x6
     f28:	03878793          	addi	a5,a5,56
     f2c:	00178713          	addi	a4,a5,1
     f30:	070e                	slli	a4,a4,0x3
     f32:	974a                	add	a4,a4,s2
     f34:	4340                	lw	s0,4(a4)
     f36:	ff870593          	addi	a1,a4,-8
     f3a:	453d                	li	a0,15
     f3c:	00b40963          	beq	s0,a1,f4e <_malloc_r+0xce>
     f40:	4058                	lw	a4,4(s0)
     f42:	9b71                	andi	a4,a4,-4
     f44:	40970633          	sub	a2,a4,s1
     f48:	08c55b63          	bge	a0,a2,fde <_malloc_r+0x15e>
     f4c:	17fd                	addi	a5,a5,-1
     f4e:	0785                	addi	a5,a5,1
     f50:	01092403          	lw	s0,16(s2)
     f54:	00890693          	addi	a3,s2,8
     f58:	c3018593          	addi	a1,gp,-976 # 2300 <__malloc_av_+0x8>
     f5c:	0ed40263          	beq	s0,a3,1040 <_malloc_r+0x1c0>
     f60:	4058                	lw	a4,4(s0)
     f62:	463d                	li	a2,15
     f64:	9b71                	andi	a4,a4,-4
     f66:	40970533          	sub	a0,a4,s1
     f6a:	08a65563          	bge	a2,a0,ff4 <_malloc_r+0x174>
     f6e:	0014e793          	ori	a5,s1,1
     f72:	c05c                	sw	a5,4(s0)
     f74:	00940633          	add	a2,s0,s1
     f78:	00c92a23          	sw	a2,20(s2)
     f7c:	00c92823          	sw	a2,16(s2)
     f80:	00156793          	ori	a5,a0,1
     f84:	c654                	sw	a3,12(a2)
     f86:	c614                	sw	a3,8(a2)
     f88:	c25c                	sw	a5,4(a2)
     f8a:	9722                	add	a4,a4,s0
     f8c:	c308                	sw	a0,0(a4)
     f8e:	854e                	mv	a0,s3
     f90:	2945                	jal	1440 <__malloc_unlock>
     f92:	00840513          	addi	a0,s0,8
     f96:	bf29                	j	eb0 <_malloc_r+0x30>
     f98:	47d1                	li	a5,20
     f9a:	00e7e563          	bltu	a5,a4,fa4 <_malloc_r+0x124>
     f9e:	05b70793          	addi	a5,a4,91
     fa2:	b769                	j	f2c <_malloc_r+0xac>
     fa4:	05400793          	li	a5,84
     fa8:	00e7e763          	bltu	a5,a4,fb6 <_malloc_r+0x136>
     fac:	00c4d793          	srli	a5,s1,0xc
     fb0:	06e78793          	addi	a5,a5,110
     fb4:	bfa5                	j	f2c <_malloc_r+0xac>
     fb6:	15400793          	li	a5,340
     fba:	00e7e763          	bltu	a5,a4,fc8 <_malloc_r+0x148>
     fbe:	00f4d793          	srli	a5,s1,0xf
     fc2:	07778793          	addi	a5,a5,119
     fc6:	b79d                	j	f2c <_malloc_r+0xac>
     fc8:	55400693          	li	a3,1364
     fcc:	07e00793          	li	a5,126
     fd0:	f4e6eee3          	bltu	a3,a4,f2c <_malloc_r+0xac>
     fd4:	0124d793          	srli	a5,s1,0x12
     fd8:	07c78793          	addi	a5,a5,124
     fdc:	bf81                	j	f2c <_malloc_r+0xac>
     fde:	4454                	lw	a3,12(s0)
     fe0:	00064863          	bltz	a2,ff0 <_malloc_r+0x170>
     fe4:	441c                	lw	a5,8(s0)
     fe6:	c7d4                	sw	a3,12(a5)
     fe8:	c69c                	sw	a5,8(a3)
     fea:	00e407b3          	add	a5,s0,a4
     fee:	bf31                	j	f0a <_malloc_r+0x8a>
     ff0:	8436                	mv	s0,a3
     ff2:	b7a9                	j	f3c <_malloc_r+0xbc>
     ff4:	00d92a23          	sw	a3,20(s2)
     ff8:	00d92823          	sw	a3,16(s2)
     ffc:	00054863          	bltz	a0,100c <_malloc_r+0x18c>
    1000:	9722                	add	a4,a4,s0
    1002:	435c                	lw	a5,4(a4)
    1004:	0017e793          	ori	a5,a5,1
    1008:	c35c                	sw	a5,4(a4)
    100a:	b751                	j	f8e <_malloc_r+0x10e>
    100c:	1ff00693          	li	a3,511
    1010:	00492803          	lw	a6,4(s2)
    1014:	10e6ee63          	bltu	a3,a4,1130 <_malloc_r+0x2b0>
    1018:	830d                	srli	a4,a4,0x3
    101a:	40275613          	srai	a2,a4,0x2
    101e:	4685                	li	a3,1
    1020:	0705                	addi	a4,a4,1
    1022:	00c696b3          	sll	a3,a3,a2
    1026:	070e                	slli	a4,a4,0x3
    1028:	974a                	add	a4,a4,s2
    102a:	0106e6b3          	or	a3,a3,a6
    102e:	00d92223          	sw	a3,4(s2)
    1032:	4314                	lw	a3,0(a4)
    1034:	ff870613          	addi	a2,a4,-8
    1038:	c450                	sw	a2,12(s0)
    103a:	c414                	sw	a3,8(s0)
    103c:	c300                	sw	s0,0(a4)
    103e:	c6c0                	sw	s0,12(a3)
    1040:	4027d713          	srai	a4,a5,0x2
    1044:	4305                	li	t1,1
    1046:	00e31333          	sll	t1,t1,a4
    104a:	00492703          	lw	a4,4(s2)
    104e:	04676c63          	bltu	a4,t1,10a6 <_malloc_r+0x226>
    1052:	006776b3          	and	a3,a4,t1
    1056:	e699                	bnez	a3,1064 <_malloc_r+0x1e4>
    1058:	9bf1                	andi	a5,a5,-4
    105a:	0306                	slli	t1,t1,0x1
    105c:	006776b3          	and	a3,a4,t1
    1060:	0791                	addi	a5,a5,4
    1062:	dee5                	beqz	a3,105a <_malloc_r+0x1da>
    1064:	4e3d                	li	t3,15
    1066:	00379693          	slli	a3,a5,0x3
    106a:	96ca                	add	a3,a3,s2
    106c:	8836                	mv	a6,a3
    106e:	853e                	mv	a0,a5
    1070:	00c82403          	lw	s0,12(a6)
    1074:	15041963          	bne	s0,a6,11c6 <_malloc_r+0x346>
    1078:	0505                	addi	a0,a0,1
    107a:	00357713          	andi	a4,a0,3
    107e:	0821                	addi	a6,a6,8
    1080:	fb65                	bnez	a4,1070 <_malloc_r+0x1f0>
    1082:	0037f713          	andi	a4,a5,3
    1086:	18071963          	bnez	a4,1218 <_malloc_r+0x398>
    108a:	00492703          	lw	a4,4(s2)
    108e:	fff34793          	not	a5,t1
    1092:	8ff9                	and	a5,a5,a4
    1094:	00f92223          	sw	a5,4(s2)
    1098:	00492703          	lw	a4,4(s2)
    109c:	0306                	slli	t1,t1,0x1
    109e:	00676463          	bltu	a4,t1,10a6 <_malloc_r+0x226>
    10a2:	18031763          	bnez	t1,1230 <_malloc_r+0x3b0>
    10a6:	00892b83          	lw	s7,8(s2)
    10aa:	004ba403          	lw	s0,4(s7) # 80000004 <_sp+0x7fffd0b4>
    10ae:	ffc47a93          	andi	s5,s0,-4
    10b2:	009ae763          	bltu	s5,s1,10c0 <_malloc_r+0x240>
    10b6:	409a8733          	sub	a4,s5,s1
    10ba:	47bd                	li	a5,15
    10bc:	24e7ca63          	blt	a5,a4,1310 <_malloc_r+0x490>
    10c0:	04c1a403          	lw	s0,76(gp) # 271c <__malloc_top_pad>
    10c4:	03c1a703          	lw	a4,60(gp) # 270c <__malloc_sbrk_base>
    10c8:	57fd                	li	a5,-1
    10ca:	015b8cb3          	add	s9,s7,s5
    10ce:	9426                	add	s0,s0,s1
    10d0:	16f71263          	bne	a4,a5,1234 <_malloc_r+0x3b4>
    10d4:	0441                	addi	s0,s0,16
    10d6:	85a2                	mv	a1,s0
    10d8:	854e                	mv	a0,s3
    10da:	2ddd                	jal	17d0 <_sbrk_r>
    10dc:	57fd                	li	a5,-1
    10de:	8b2a                	mv	s6,a0
    10e0:	1cf50e63          	beq	a0,a5,12bc <_malloc_r+0x43c>
    10e4:	01957463          	bgeu	a0,s9,10ec <_malloc_r+0x26c>
    10e8:	1d2b9a63          	bne	s7,s2,12bc <_malloc_r+0x43c>
    10ec:	05018693          	addi	a3,gp,80 # 2720 <__malloc_current_mallinfo>
    10f0:	4298                	lw	a4,0(a3)
    10f2:	05018c13          	addi	s8,gp,80 # 2720 <__malloc_current_mallinfo>
    10f6:	9722                	add	a4,a4,s0
    10f8:	c298                	sw	a4,0(a3)
    10fa:	156c9363          	bne	s9,s6,1240 <_malloc_r+0x3c0>
    10fe:	014c9793          	slli	a5,s9,0x14
    1102:	12079f63          	bnez	a5,1240 <_malloc_r+0x3c0>
    1106:	00892783          	lw	a5,8(s2)
    110a:	9456                	add	s0,s0,s5
    110c:	00146413          	ori	s0,s0,1
    1110:	c3c0                	sw	s0,4(a5)
    1112:	000c2783          	lw	a5,0(s8)
    1116:	0481a683          	lw	a3,72(gp) # 2718 <__malloc_max_sbrked_mem>
    111a:	00f6f463          	bgeu	a3,a5,1122 <_malloc_r+0x2a2>
    111e:	04f1a423          	sw	a5,72(gp) # 2718 <__malloc_max_sbrked_mem>
    1122:	0441a683          	lw	a3,68(gp) # 2714 <_edata>
    1126:	18f6fb63          	bgeu	a3,a5,12bc <_malloc_r+0x43c>
    112a:	04f1a223          	sw	a5,68(gp) # 2714 <_edata>
    112e:	a279                	j	12bc <_malloc_r+0x43c>
    1130:	00975613          	srli	a2,a4,0x9
    1134:	4691                	li	a3,4
    1136:	02c6ec63          	bltu	a3,a2,116e <_malloc_r+0x2ee>
    113a:	00675693          	srli	a3,a4,0x6
    113e:	03868693          	addi	a3,a3,56
    1142:	00168613          	addi	a2,a3,1
    1146:	060e                	slli	a2,a2,0x3
    1148:	964a                	add	a2,a2,s2
    114a:	ff860513          	addi	a0,a2,-8
    114e:	4210                	lw	a2,0(a2)
    1150:	06c51563          	bne	a0,a2,11ba <_malloc_r+0x33a>
    1154:	8689                	srai	a3,a3,0x2
    1156:	4705                	li	a4,1
    1158:	00d716b3          	sll	a3,a4,a3
    115c:	0106e6b3          	or	a3,a3,a6
    1160:	00d92223          	sw	a3,4(s2)
    1164:	c448                	sw	a0,12(s0)
    1166:	c410                	sw	a2,8(s0)
    1168:	c500                	sw	s0,8(a0)
    116a:	c640                	sw	s0,12(a2)
    116c:	bdd1                	j	1040 <_malloc_r+0x1c0>
    116e:	46d1                	li	a3,20
    1170:	00c6e563          	bltu	a3,a2,117a <_malloc_r+0x2fa>
    1174:	05b60693          	addi	a3,a2,91
    1178:	b7e9                	j	1142 <_malloc_r+0x2c2>
    117a:	05400693          	li	a3,84
    117e:	00c6e763          	bltu	a3,a2,118c <_malloc_r+0x30c>
    1182:	00c75693          	srli	a3,a4,0xc
    1186:	06e68693          	addi	a3,a3,110
    118a:	bf65                	j	1142 <_malloc_r+0x2c2>
    118c:	15400693          	li	a3,340
    1190:	00c6e763          	bltu	a3,a2,119e <_malloc_r+0x31e>
    1194:	00f75693          	srli	a3,a4,0xf
    1198:	07768693          	addi	a3,a3,119
    119c:	b75d                	j	1142 <_malloc_r+0x2c2>
    119e:	55400513          	li	a0,1364
    11a2:	07e00693          	li	a3,126
    11a6:	f8c56ee3          	bltu	a0,a2,1142 <_malloc_r+0x2c2>
    11aa:	01275693          	srli	a3,a4,0x12
    11ae:	07c68693          	addi	a3,a3,124
    11b2:	bf41                	j	1142 <_malloc_r+0x2c2>
    11b4:	4610                	lw	a2,8(a2)
    11b6:	00c50663          	beq	a0,a2,11c2 <_malloc_r+0x342>
    11ba:	4254                	lw	a3,4(a2)
    11bc:	9af1                	andi	a3,a3,-4
    11be:	fed76be3          	bltu	a4,a3,11b4 <_malloc_r+0x334>
    11c2:	4648                	lw	a0,12(a2)
    11c4:	b745                	j	1164 <_malloc_r+0x2e4>
    11c6:	4058                	lw	a4,4(s0)
    11c8:	4450                	lw	a2,12(s0)
    11ca:	9b71                	andi	a4,a4,-4
    11cc:	409708b3          	sub	a7,a4,s1
    11d0:	031e5763          	bge	t3,a7,11fe <_malloc_r+0x37e>
    11d4:	0014e793          	ori	a5,s1,1
    11d8:	c05c                	sw	a5,4(s0)
    11da:	441c                	lw	a5,8(s0)
    11dc:	009406b3          	add	a3,s0,s1
    11e0:	9722                	add	a4,a4,s0
    11e2:	c7d0                	sw	a2,12(a5)
    11e4:	c61c                	sw	a5,8(a2)
    11e6:	00d92a23          	sw	a3,20(s2)
    11ea:	00d92823          	sw	a3,16(s2)
    11ee:	0018e793          	ori	a5,a7,1
    11f2:	c6cc                	sw	a1,12(a3)
    11f4:	c68c                	sw	a1,8(a3)
    11f6:	c2dc                	sw	a5,4(a3)
    11f8:	01172023          	sw	a7,0(a4)
    11fc:	bb49                	j	f8e <_malloc_r+0x10e>
    11fe:	0008cb63          	bltz	a7,1214 <_malloc_r+0x394>
    1202:	9722                	add	a4,a4,s0
    1204:	435c                	lw	a5,4(a4)
    1206:	0017e793          	ori	a5,a5,1
    120a:	c35c                	sw	a5,4(a4)
    120c:	441c                	lw	a5,8(s0)
    120e:	c7d0                	sw	a2,12(a5)
    1210:	c61c                	sw	a5,8(a2)
    1212:	bbb5                	j	f8e <_malloc_r+0x10e>
    1214:	8432                	mv	s0,a2
    1216:	bdb9                	j	1074 <_malloc_r+0x1f4>
    1218:	16e1                	addi	a3,a3,-8
    121a:	4698                	lw	a4,8(a3)
    121c:	17fd                	addi	a5,a5,-1
    121e:	e6d702e3          	beq	a4,a3,1082 <_malloc_r+0x202>
    1222:	bd9d                	j	1098 <_malloc_r+0x218>
    1224:	0791                	addi	a5,a5,4
    1226:	0306                	slli	t1,t1,0x1
    1228:	006776b3          	and	a3,a4,t1
    122c:	dee5                	beqz	a3,1224 <_malloc_r+0x3a4>
    122e:	bd25                	j	1066 <_malloc_r+0x1e6>
    1230:	87aa                	mv	a5,a0
    1232:	bfdd                	j	1228 <_malloc_r+0x3a8>
    1234:	6705                	lui	a4,0x1
    1236:	073d                	addi	a4,a4,15
    1238:	943a                	add	s0,s0,a4
    123a:	77fd                	lui	a5,0xfffff
    123c:	8c7d                	and	s0,s0,a5
    123e:	bd61                	j	10d6 <_malloc_r+0x256>
    1240:	03c1a683          	lw	a3,60(gp) # 270c <__malloc_sbrk_base>
    1244:	57fd                	li	a5,-1
    1246:	08f69963          	bne	a3,a5,12d8 <_malloc_r+0x458>
    124a:	0361ae23          	sw	s6,60(gp) # 270c <__malloc_sbrk_base>
    124e:	007b7c93          	andi	s9,s6,7
    1252:	4781                	li	a5,0
    1254:	000c8663          	beqz	s9,1260 <_malloc_r+0x3e0>
    1258:	47a1                	li	a5,8
    125a:	419787b3          	sub	a5,a5,s9
    125e:	9b3e                	add	s6,s6,a5
    1260:	6505                	lui	a0,0x1
    1262:	00a78a33          	add	s4,a5,a0
    1266:	945a                	add	s0,s0,s6
    1268:	157d                	addi	a0,a0,-1
    126a:	00a477b3          	and	a5,s0,a0
    126e:	40fa0a33          	sub	s4,s4,a5
    1272:	00aa7a33          	and	s4,s4,a0
    1276:	85d2                	mv	a1,s4
    1278:	854e                	mv	a0,s3
    127a:	2b99                	jal	17d0 <_sbrk_r>
    127c:	57fd                	li	a5,-1
    127e:	00f51963          	bne	a0,a5,1290 <_malloc_r+0x410>
    1282:	8522                	mv	a0,s0
    1284:	000c8563          	beqz	s9,128e <_malloc_r+0x40e>
    1288:	ff8c8513          	addi	a0,s9,-8
    128c:	9522                	add	a0,a0,s0
    128e:	4a01                	li	s4,0
    1290:	000c2783          	lw	a5,0(s8)
    1294:	41650533          	sub	a0,a0,s6
    1298:	01692423          	sw	s6,8(s2)
    129c:	97d2                	add	a5,a5,s4
    129e:	9a2a                	add	s4,s4,a0
    12a0:	001a6a13          	ori	s4,s4,1
    12a4:	00fc2023          	sw	a5,0(s8)
    12a8:	014b2223          	sw	s4,4(s6) # 80000004 <_sp+0x7fffd0b4>
    12ac:	e72b83e3          	beq	s7,s2,1112 <_malloc_r+0x292>
    12b0:	473d                	li	a4,15
    12b2:	03576963          	bltu	a4,s5,12e4 <_malloc_r+0x464>
    12b6:	4785                	li	a5,1
    12b8:	00fb2223          	sw	a5,4(s6)
    12bc:	00892783          	lw	a5,8(s2)
    12c0:	43dc                	lw	a5,4(a5)
    12c2:	9bf1                	andi	a5,a5,-4
    12c4:	40978733          	sub	a4,a5,s1
    12c8:	0097e563          	bltu	a5,s1,12d2 <_malloc_r+0x452>
    12cc:	47bd                	li	a5,15
    12ce:	04e7c163          	blt	a5,a4,1310 <_malloc_r+0x490>
    12d2:	854e                	mv	a0,s3
    12d4:	22b5                	jal	1440 <__malloc_unlock>
    12d6:	bee1                	j	eae <_malloc_r+0x2e>
    12d8:	419b07b3          	sub	a5,s6,s9
    12dc:	97ba                	add	a5,a5,a4
    12de:	00fc2023          	sw	a5,0(s8)
    12e2:	b7b5                	j	124e <_malloc_r+0x3ce>
    12e4:	004ba783          	lw	a5,4(s7)
    12e8:	ff4a8413          	addi	s0,s5,-12
    12ec:	9861                	andi	s0,s0,-8
    12ee:	8b85                	andi	a5,a5,1
    12f0:	8fc1                	or	a5,a5,s0
    12f2:	00fba223          	sw	a5,4(s7)
    12f6:	4695                	li	a3,5
    12f8:	008b87b3          	add	a5,s7,s0
    12fc:	c3d4                	sw	a3,4(a5)
    12fe:	c794                	sw	a3,8(a5)
    1300:	e08779e3          	bgeu	a4,s0,1112 <_malloc_r+0x292>
    1304:	008b8593          	addi	a1,s7,8
    1308:	854e                	mv	a0,s3
    130a:	e32ff0ef          	jal	ra,93c <_free_r>
    130e:	b511                	j	1112 <_malloc_r+0x292>
    1310:	00892403          	lw	s0,8(s2)
    1314:	0014e793          	ori	a5,s1,1
    1318:	c05c                	sw	a5,4(s0)
    131a:	009407b3          	add	a5,s0,s1
    131e:	00f92423          	sw	a5,8(s2)
    1322:	b6ed                	j	f0c <_malloc_r+0x8c>

00001324 <memchr>:
    1324:	0ff5f593          	andi	a1,a1,255
    1328:	962a                	add	a2,a2,a0
    132a:	00c51463          	bne	a0,a2,1332 <memchr+0xe>
    132e:	4501                	li	a0,0
    1330:	8082                	ret
    1332:	00054783          	lbu	a5,0(a0) # 1000 <_malloc_r+0x180>
    1336:	feb78de3          	beq	a5,a1,1330 <memchr+0xc>
    133a:	0505                	addi	a0,a0,1
    133c:	b7fd                	j	132a <memchr+0x6>

0000133e <memcpy>:
    133e:	00a5c7b3          	xor	a5,a1,a0
    1342:	8b8d                	andi	a5,a5,3
    1344:	00c50733          	add	a4,a0,a2
    1348:	e781                	bnez	a5,1350 <memcpy+0x12>
    134a:	478d                	li	a5,3
    134c:	00c7ee63          	bltu	a5,a2,1368 <memcpy+0x2a>
    1350:	87aa                	mv	a5,a0
    1352:	0ae57063          	bgeu	a0,a4,13f2 <memcpy+0xb4>
    1356:	0005c683          	lbu	a3,0(a1)
    135a:	0785                	addi	a5,a5,1
    135c:	0585                	addi	a1,a1,1
    135e:	fed78fa3          	sb	a3,-1(a5) # ffffefff <_sp+0xffffc0af>
    1362:	fee7eae3          	bltu	a5,a4,1356 <memcpy+0x18>
    1366:	8082                	ret
    1368:	00357693          	andi	a3,a0,3
    136c:	87aa                	mv	a5,a0
    136e:	ca91                	beqz	a3,1382 <memcpy+0x44>
    1370:	0005c683          	lbu	a3,0(a1)
    1374:	0785                	addi	a5,a5,1
    1376:	0585                	addi	a1,a1,1
    1378:	fed78fa3          	sb	a3,-1(a5)
    137c:	0037f693          	andi	a3,a5,3
    1380:	b7fd                	j	136e <memcpy+0x30>
    1382:	ffc77693          	andi	a3,a4,-4
    1386:	fe068613          	addi	a2,a3,-32
    138a:	06c7f063          	bgeu	a5,a2,13ea <memcpy+0xac>
    138e:	0005a383          	lw	t2,0(a1)
    1392:	0045a283          	lw	t0,4(a1)
    1396:	0085af83          	lw	t6,8(a1)
    139a:	00c5af03          	lw	t5,12(a1)
    139e:	0105ae83          	lw	t4,16(a1)
    13a2:	0145ae03          	lw	t3,20(a1)
    13a6:	0185a303          	lw	t1,24(a1)
    13aa:	01c5a883          	lw	a7,28(a1)
    13ae:	02458593          	addi	a1,a1,36
    13b2:	0077a023          	sw	t2,0(a5)
    13b6:	ffc5a803          	lw	a6,-4(a1)
    13ba:	0057a223          	sw	t0,4(a5)
    13be:	01f7a423          	sw	t6,8(a5)
    13c2:	01e7a623          	sw	t5,12(a5)
    13c6:	01d7a823          	sw	t4,16(a5)
    13ca:	01c7aa23          	sw	t3,20(a5)
    13ce:	0067ac23          	sw	t1,24(a5)
    13d2:	0117ae23          	sw	a7,28(a5)
    13d6:	02478793          	addi	a5,a5,36
    13da:	ff07ae23          	sw	a6,-4(a5)
    13de:	b775                	j	138a <memcpy+0x4c>
    13e0:	4190                	lw	a2,0(a1)
    13e2:	0791                	addi	a5,a5,4
    13e4:	0591                	addi	a1,a1,4
    13e6:	fec7ae23          	sw	a2,-4(a5)
    13ea:	fed7ebe3          	bltu	a5,a3,13e0 <memcpy+0xa2>
    13ee:	f6e7e4e3          	bltu	a5,a4,1356 <memcpy+0x18>
    13f2:	8082                	ret

000013f4 <memmove>:
    13f4:	04a5f363          	bgeu	a1,a0,143a <memmove+0x46>
    13f8:	00c586b3          	add	a3,a1,a2
    13fc:	02d57f63          	bgeu	a0,a3,143a <memmove+0x46>
    1400:	fff64593          	not	a1,a2
    1404:	4781                	li	a5,0
    1406:	17fd                	addi	a5,a5,-1
    1408:	00f59363          	bne	a1,a5,140e <memmove+0x1a>
    140c:	8082                	ret
    140e:	00f68733          	add	a4,a3,a5
    1412:	00074803          	lbu	a6,0(a4) # 1000 <_malloc_r+0x180>
    1416:	00c78733          	add	a4,a5,a2
    141a:	972a                	add	a4,a4,a0
    141c:	01070023          	sb	a6,0(a4)
    1420:	b7dd                	j	1406 <memmove+0x12>
    1422:	00f58733          	add	a4,a1,a5
    1426:	00074683          	lbu	a3,0(a4)
    142a:	00f50733          	add	a4,a0,a5
    142e:	0785                	addi	a5,a5,1
    1430:	00d70023          	sb	a3,0(a4)
    1434:	fef617e3          	bne	a2,a5,1422 <memmove+0x2e>
    1438:	8082                	ret
    143a:	4781                	li	a5,0
    143c:	bfe5                	j	1434 <memmove+0x40>

0000143e <__malloc_lock>:
    143e:	8082                	ret

00001440 <__malloc_unlock>:
    1440:	8082                	ret

00001442 <_realloc_r>:
    1442:	7139                	addi	sp,sp,-64
    1444:	dc22                	sw	s0,56(sp)
    1446:	de06                	sw	ra,60(sp)
    1448:	842e                	mv	s0,a1
    144a:	da26                	sw	s1,52(sp)
    144c:	d84a                	sw	s2,48(sp)
    144e:	d64e                	sw	s3,44(sp)
    1450:	d452                	sw	s4,40(sp)
    1452:	d256                	sw	s5,36(sp)
    1454:	d05a                	sw	s6,32(sp)
    1456:	ce5e                	sw	s7,28(sp)
    1458:	cc62                	sw	s8,24(sp)
    145a:	85b2                	mv	a1,a2
    145c:	ec11                	bnez	s0,1478 <_realloc_r+0x36>
    145e:	5462                	lw	s0,56(sp)
    1460:	50f2                	lw	ra,60(sp)
    1462:	54d2                	lw	s1,52(sp)
    1464:	5942                	lw	s2,48(sp)
    1466:	59b2                	lw	s3,44(sp)
    1468:	5a22                	lw	s4,40(sp)
    146a:	5a92                	lw	s5,36(sp)
    146c:	5b02                	lw	s6,32(sp)
    146e:	4bf2                	lw	s7,28(sp)
    1470:	4c62                	lw	s8,24(sp)
    1472:	6121                	addi	sp,sp,64
    1474:	a0dff06f          	j	e80 <_malloc_r>
    1478:	8aaa                	mv	s5,a0
    147a:	c632                	sw	a2,12(sp)
    147c:	37c9                	jal	143e <__malloc_lock>
    147e:	45b2                	lw	a1,12(sp)
    1480:	47d9                	li	a5,22
    1482:	00b58993          	addi	s3,a1,11
    1486:	0337f763          	bgeu	a5,s3,14b4 <_realloc_r+0x72>
    148a:	ff89fb13          	andi	s6,s3,-8
    148e:	020b5463          	bgez	s6,14b6 <_realloc_r+0x74>
    1492:	47b1                	li	a5,12
    1494:	00faa023          	sw	a5,0(s5)
    1498:	4a01                	li	s4,0
    149a:	50f2                	lw	ra,60(sp)
    149c:	5462                	lw	s0,56(sp)
    149e:	8552                	mv	a0,s4
    14a0:	54d2                	lw	s1,52(sp)
    14a2:	5942                	lw	s2,48(sp)
    14a4:	59b2                	lw	s3,44(sp)
    14a6:	5a22                	lw	s4,40(sp)
    14a8:	5a92                	lw	s5,36(sp)
    14aa:	5b02                	lw	s6,32(sp)
    14ac:	4bf2                	lw	s7,28(sp)
    14ae:	4c62                	lw	s8,24(sp)
    14b0:	6121                	addi	sp,sp,64
    14b2:	8082                	ret
    14b4:	4b41                	li	s6,16
    14b6:	fcbb6ee3          	bltu	s6,a1,1492 <_realloc_r+0x50>
    14ba:	ffc42683          	lw	a3,-4(s0)
    14be:	ff840b93          	addi	s7,s0,-8
    14c2:	ffc6f913          	andi	s2,a3,-4
    14c6:	2f695a63          	bge	s2,s6,17ba <_realloc_r+0x378>
    14ca:	c2818713          	addi	a4,gp,-984 # 22f8 <__malloc_av_>
    14ce:	4710                	lw	a2,8(a4)
    14d0:	012b87b3          	add	a5,s7,s2
    14d4:	43d8                	lw	a4,4(a5)
    14d6:	c2818c13          	addi	s8,gp,-984 # 22f8 <__malloc_av_>
    14da:	00f60863          	beq	a2,a5,14ea <_realloc_r+0xa8>
    14de:	ffe77513          	andi	a0,a4,-2
    14e2:	953e                	add	a0,a0,a5
    14e4:	4148                	lw	a0,4(a0)
    14e6:	8905                	andi	a0,a0,1
    14e8:	e539                	bnez	a0,1536 <_realloc_r+0xf4>
    14ea:	9b71                	andi	a4,a4,-4
    14ec:	00e909b3          	add	s3,s2,a4
    14f0:	02f61b63          	bne	a2,a5,1526 <_realloc_r+0xe4>
    14f4:	010b0513          	addi	a0,s6,16
    14f8:	04a9c163          	blt	s3,a0,153a <_realloc_r+0xf8>
    14fc:	9bda                	add	s7,s7,s6
    14fe:	416989b3          	sub	s3,s3,s6
    1502:	017c2423          	sw	s7,8(s8)
    1506:	0019e993          	ori	s3,s3,1
    150a:	013ba223          	sw	s3,4(s7)
    150e:	ffc42983          	lw	s3,-4(s0)
    1512:	8556                	mv	a0,s5
    1514:	8a22                	mv	s4,s0
    1516:	0019f993          	andi	s3,s3,1
    151a:	0169e9b3          	or	s3,s3,s6
    151e:	ff342e23          	sw	s3,-4(s0)
    1522:	3f39                	jal	1440 <__malloc_unlock>
    1524:	bf9d                	j	149a <_realloc_r+0x58>
    1526:	0169ca63          	blt	s3,s6,153a <_realloc_r+0xf8>
    152a:	47d8                	lw	a4,12(a5)
    152c:	479c                	lw	a5,8(a5)
    152e:	c7d8                	sw	a4,12(a5)
    1530:	c71c                	sw	a5,8(a4)
    1532:	84de                	mv	s1,s7
    1534:	aa01                	j	1644 <_realloc_r+0x202>
    1536:	4701                	li	a4,0
    1538:	4781                	li	a5,0
    153a:	8a85                	andi	a3,a3,1
    153c:	1e069263          	bnez	a3,1720 <_realloc_r+0x2de>
    1540:	ff842483          	lw	s1,-8(s0)
    1544:	409b84b3          	sub	s1,s7,s1
    1548:	0044aa03          	lw	s4,4(s1)
    154c:	ffca7a13          	andi	s4,s4,-4
    1550:	9a4a                	add	s4,s4,s2
    1552:	14078e63          	beqz	a5,16ae <_realloc_r+0x26c>
    1556:	014709b3          	add	s3,a4,s4
    155a:	0af61063          	bne	a2,a5,15fa <_realloc_r+0x1b8>
    155e:	010b0793          	addi	a5,s6,16
    1562:	14f9c663          	blt	s3,a5,16ae <_realloc_r+0x26c>
    1566:	4498                	lw	a4,8(s1)
    1568:	44dc                	lw	a5,12(s1)
    156a:	ffc90613          	addi	a2,s2,-4
    156e:	00848a13          	addi	s4,s1,8
    1572:	c75c                	sw	a5,12(a4)
    1574:	c798                	sw	a4,8(a5)
    1576:	02400713          	li	a4,36
    157a:	06c76c63          	bltu	a4,a2,15f2 <_realloc_r+0x1b0>
    157e:	46cd                	li	a3,19
    1580:	87d2                	mv	a5,s4
    1582:	00c6fc63          	bgeu	a3,a2,159a <_realloc_r+0x158>
    1586:	401c                	lw	a5,0(s0)
    1588:	c49c                	sw	a5,8(s1)
    158a:	405c                	lw	a5,4(s0)
    158c:	c4dc                	sw	a5,12(s1)
    158e:	47ed                	li	a5,27
    1590:	02c7ee63          	bltu	a5,a2,15cc <_realloc_r+0x18a>
    1594:	0421                	addi	s0,s0,8
    1596:	01048793          	addi	a5,s1,16
    159a:	4018                	lw	a4,0(s0)
    159c:	c398                	sw	a4,0(a5)
    159e:	4058                	lw	a4,4(s0)
    15a0:	c3d8                	sw	a4,4(a5)
    15a2:	4418                	lw	a4,8(s0)
    15a4:	c798                	sw	a4,8(a5)
    15a6:	016487b3          	add	a5,s1,s6
    15aa:	416989b3          	sub	s3,s3,s6
    15ae:	00fc2423          	sw	a5,8(s8)
    15b2:	0019e993          	ori	s3,s3,1
    15b6:	0137a223          	sw	s3,4(a5)
    15ba:	40dc                	lw	a5,4(s1)
    15bc:	8b85                	andi	a5,a5,1
    15be:	0167e9b3          	or	s3,a5,s6
    15c2:	0134a223          	sw	s3,4(s1)
    15c6:	8556                	mv	a0,s5
    15c8:	3da5                	jal	1440 <__malloc_unlock>
    15ca:	bdc1                	j	149a <_realloc_r+0x58>
    15cc:	441c                	lw	a5,8(s0)
    15ce:	c89c                	sw	a5,16(s1)
    15d0:	445c                	lw	a5,12(s0)
    15d2:	c8dc                	sw	a5,20(s1)
    15d4:	00e60663          	beq	a2,a4,15e0 <_realloc_r+0x19e>
    15d8:	0441                	addi	s0,s0,16
    15da:	01848793          	addi	a5,s1,24
    15de:	bf75                	j	159a <_realloc_r+0x158>
    15e0:	481c                	lw	a5,16(s0)
    15e2:	0461                	addi	s0,s0,24
    15e4:	cc9c                	sw	a5,24(s1)
    15e6:	ffc42703          	lw	a4,-4(s0)
    15ea:	02048793          	addi	a5,s1,32
    15ee:	ccd8                	sw	a4,28(s1)
    15f0:	b76d                	j	159a <_realloc_r+0x158>
    15f2:	85a2                	mv	a1,s0
    15f4:	8552                	mv	a0,s4
    15f6:	3bfd                	jal	13f4 <memmove>
    15f8:	b77d                	j	15a6 <_realloc_r+0x164>
    15fa:	0b69ca63          	blt	s3,s6,16ae <_realloc_r+0x26c>
    15fe:	47d8                	lw	a4,12(a5)
    1600:	479c                	lw	a5,8(a5)
    1602:	ffc90613          	addi	a2,s2,-4
    1606:	00848513          	addi	a0,s1,8
    160a:	c7d8                	sw	a4,12(a5)
    160c:	c71c                	sw	a5,8(a4)
    160e:	4498                	lw	a4,8(s1)
    1610:	44dc                	lw	a5,12(s1)
    1612:	c75c                	sw	a5,12(a4)
    1614:	c798                	sw	a4,8(a5)
    1616:	02400793          	li	a5,36
    161a:	08c7e763          	bltu	a5,a2,16a8 <_realloc_r+0x266>
    161e:	474d                	li	a4,19
    1620:	00c77c63          	bgeu	a4,a2,1638 <_realloc_r+0x1f6>
    1624:	4018                	lw	a4,0(s0)
    1626:	c498                	sw	a4,8(s1)
    1628:	4058                	lw	a4,4(s0)
    162a:	c4d8                	sw	a4,12(s1)
    162c:	476d                	li	a4,27
    162e:	04c76a63          	bltu	a4,a2,1682 <_realloc_r+0x240>
    1632:	0421                	addi	s0,s0,8
    1634:	01048513          	addi	a0,s1,16
    1638:	401c                	lw	a5,0(s0)
    163a:	c11c                	sw	a5,0(a0)
    163c:	405c                	lw	a5,4(s0)
    163e:	c15c                	sw	a5,4(a0)
    1640:	441c                	lw	a5,8(s0)
    1642:	c51c                	sw	a5,8(a0)
    1644:	40d8                	lw	a4,4(s1)
    1646:	416986b3          	sub	a3,s3,s6
    164a:	463d                	li	a2,15
    164c:	8b05                	andi	a4,a4,1
    164e:	013487b3          	add	a5,s1,s3
    1652:	16d67663          	bgeu	a2,a3,17be <_realloc_r+0x37c>
    1656:	00eb69b3          	or	s3,s6,a4
    165a:	0134a223          	sw	s3,4(s1)
    165e:	016485b3          	add	a1,s1,s6
    1662:	0016e693          	ori	a3,a3,1
    1666:	c1d4                	sw	a3,4(a1)
    1668:	43d8                	lw	a4,4(a5)
    166a:	05a1                	addi	a1,a1,8
    166c:	8556                	mv	a0,s5
    166e:	00176713          	ori	a4,a4,1
    1672:	c3d8                	sw	a4,4(a5)
    1674:	ac8ff0ef          	jal	ra,93c <_free_r>
    1678:	8556                	mv	a0,s5
    167a:	33d9                	jal	1440 <__malloc_unlock>
    167c:	00848a13          	addi	s4,s1,8
    1680:	bd29                	j	149a <_realloc_r+0x58>
    1682:	4418                	lw	a4,8(s0)
    1684:	c898                	sw	a4,16(s1)
    1686:	4458                	lw	a4,12(s0)
    1688:	c8d8                	sw	a4,20(s1)
    168a:	00f60663          	beq	a2,a5,1696 <_realloc_r+0x254>
    168e:	0441                	addi	s0,s0,16
    1690:	01848513          	addi	a0,s1,24
    1694:	b755                	j	1638 <_realloc_r+0x1f6>
    1696:	481c                	lw	a5,16(s0)
    1698:	02048513          	addi	a0,s1,32
    169c:	0461                	addi	s0,s0,24
    169e:	cc9c                	sw	a5,24(s1)
    16a0:	ffc42783          	lw	a5,-4(s0)
    16a4:	ccdc                	sw	a5,28(s1)
    16a6:	bf49                	j	1638 <_realloc_r+0x1f6>
    16a8:	85a2                	mv	a1,s0
    16aa:	33a9                	jal	13f4 <memmove>
    16ac:	bf61                	j	1644 <_realloc_r+0x202>
    16ae:	076a4963          	blt	s4,s6,1720 <_realloc_r+0x2de>
    16b2:	44dc                	lw	a5,12(s1)
    16b4:	4498                	lw	a4,8(s1)
    16b6:	ffc90613          	addi	a2,s2,-4
    16ba:	00848513          	addi	a0,s1,8
    16be:	c75c                	sw	a5,12(a4)
    16c0:	c798                	sw	a4,8(a5)
    16c2:	02400793          	li	a5,36
    16c6:	04c7ea63          	bltu	a5,a2,171a <_realloc_r+0x2d8>
    16ca:	474d                	li	a4,19
    16cc:	00c77c63          	bgeu	a4,a2,16e4 <_realloc_r+0x2a2>
    16d0:	4018                	lw	a4,0(s0)
    16d2:	c498                	sw	a4,8(s1)
    16d4:	4058                	lw	a4,4(s0)
    16d6:	c4d8                	sw	a4,12(s1)
    16d8:	476d                	li	a4,27
    16da:	00c76d63          	bltu	a4,a2,16f4 <_realloc_r+0x2b2>
    16de:	0421                	addi	s0,s0,8
    16e0:	01048513          	addi	a0,s1,16
    16e4:	401c                	lw	a5,0(s0)
    16e6:	c11c                	sw	a5,0(a0)
    16e8:	405c                	lw	a5,4(s0)
    16ea:	c15c                	sw	a5,4(a0)
    16ec:	441c                	lw	a5,8(s0)
    16ee:	c51c                	sw	a5,8(a0)
    16f0:	89d2                	mv	s3,s4
    16f2:	bf89                	j	1644 <_realloc_r+0x202>
    16f4:	4418                	lw	a4,8(s0)
    16f6:	c898                	sw	a4,16(s1)
    16f8:	4458                	lw	a4,12(s0)
    16fa:	c8d8                	sw	a4,20(s1)
    16fc:	00f60663          	beq	a2,a5,1708 <_realloc_r+0x2c6>
    1700:	0441                	addi	s0,s0,16
    1702:	01848513          	addi	a0,s1,24
    1706:	bff9                	j	16e4 <_realloc_r+0x2a2>
    1708:	481c                	lw	a5,16(s0)
    170a:	02048513          	addi	a0,s1,32
    170e:	0461                	addi	s0,s0,24
    1710:	cc9c                	sw	a5,24(s1)
    1712:	ffc42783          	lw	a5,-4(s0)
    1716:	ccdc                	sw	a5,28(s1)
    1718:	b7f1                	j	16e4 <_realloc_r+0x2a2>
    171a:	85a2                	mv	a1,s0
    171c:	39e1                	jal	13f4 <memmove>
    171e:	bfc9                	j	16f0 <_realloc_r+0x2ae>
    1720:	8556                	mv	a0,s5
    1722:	f5eff0ef          	jal	ra,e80 <_malloc_r>
    1726:	8a2a                	mv	s4,a0
    1728:	e8050fe3          	beqz	a0,15c6 <_realloc_r+0x184>
    172c:	ffc42783          	lw	a5,-4(s0)
    1730:	ff850713          	addi	a4,a0,-8
    1734:	9bf9                	andi	a5,a5,-2
    1736:	97de                	add	a5,a5,s7
    1738:	00e79863          	bne	a5,a4,1748 <_realloc_r+0x306>
    173c:	ffc52983          	lw	s3,-4(a0)
    1740:	ffc9f993          	andi	s3,s3,-4
    1744:	99ca                	add	s3,s3,s2
    1746:	b3f5                	j	1532 <_realloc_r+0xf0>
    1748:	ffc90613          	addi	a2,s2,-4
    174c:	02400793          	li	a5,36
    1750:	06c7e263          	bltu	a5,a2,17b4 <_realloc_r+0x372>
    1754:	474d                	li	a4,19
    1756:	04c77c63          	bgeu	a4,a2,17ae <_realloc_r+0x36c>
    175a:	4018                	lw	a4,0(s0)
    175c:	c118                	sw	a4,0(a0)
    175e:	4058                	lw	a4,4(s0)
    1760:	c158                	sw	a4,4(a0)
    1762:	476d                	li	a4,27
    1764:	02c76163          	bltu	a4,a2,1786 <_realloc_r+0x344>
    1768:	00840713          	addi	a4,s0,8
    176c:	00850793          	addi	a5,a0,8
    1770:	4314                	lw	a3,0(a4)
    1772:	c394                	sw	a3,0(a5)
    1774:	4354                	lw	a3,4(a4)
    1776:	c3d4                	sw	a3,4(a5)
    1778:	4718                	lw	a4,8(a4)
    177a:	c798                	sw	a4,8(a5)
    177c:	85a2                	mv	a1,s0
    177e:	8556                	mv	a0,s5
    1780:	9bcff0ef          	jal	ra,93c <_free_r>
    1784:	b589                	j	15c6 <_realloc_r+0x184>
    1786:	4418                	lw	a4,8(s0)
    1788:	c518                	sw	a4,8(a0)
    178a:	4458                	lw	a4,12(s0)
    178c:	c558                	sw	a4,12(a0)
    178e:	00f60763          	beq	a2,a5,179c <_realloc_r+0x35a>
    1792:	01040713          	addi	a4,s0,16
    1796:	01050793          	addi	a5,a0,16
    179a:	bfd9                	j	1770 <_realloc_r+0x32e>
    179c:	481c                	lw	a5,16(s0)
    179e:	01840713          	addi	a4,s0,24
    17a2:	c91c                	sw	a5,16(a0)
    17a4:	4854                	lw	a3,20(s0)
    17a6:	01850793          	addi	a5,a0,24
    17aa:	c954                	sw	a3,20(a0)
    17ac:	b7d1                	j	1770 <_realloc_r+0x32e>
    17ae:	87aa                	mv	a5,a0
    17b0:	8722                	mv	a4,s0
    17b2:	bf7d                	j	1770 <_realloc_r+0x32e>
    17b4:	85a2                	mv	a1,s0
    17b6:	393d                	jal	13f4 <memmove>
    17b8:	b7d1                	j	177c <_realloc_r+0x33a>
    17ba:	89ca                	mv	s3,s2
    17bc:	bb9d                	j	1532 <_realloc_r+0xf0>
    17be:	00e9e9b3          	or	s3,s3,a4
    17c2:	0134a223          	sw	s3,4(s1)
    17c6:	43d8                	lw	a4,4(a5)
    17c8:	00176713          	ori	a4,a4,1
    17cc:	c3d8                	sw	a4,4(a5)
    17ce:	b56d                	j	1678 <_realloc_r+0x236>

000017d0 <_sbrk_r>:
    17d0:	1141                	addi	sp,sp,-16
    17d2:	c422                	sw	s0,8(sp)
    17d4:	c226                	sw	s1,4(sp)
    17d6:	84aa                	mv	s1,a0
    17d8:	852e                	mv	a0,a1
    17da:	c606                	sw	ra,12(sp)
    17dc:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    17e0:	a5ffe0ef          	jal	ra,23e <_sbrk>
    17e4:	57fd                	li	a5,-1
    17e6:	00f51663          	bne	a0,a5,17f2 <_sbrk_r+0x22>
    17ea:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    17ee:	c391                	beqz	a5,17f2 <_sbrk_r+0x22>
    17f0:	c09c                	sw	a5,0(s1)
    17f2:	40b2                	lw	ra,12(sp)
    17f4:	4422                	lw	s0,8(sp)
    17f6:	4492                	lw	s1,4(sp)
    17f8:	0141                	addi	sp,sp,16
    17fa:	8082                	ret

000017fc <__sread>:
    17fc:	1141                	addi	sp,sp,-16
    17fe:	c422                	sw	s0,8(sp)
    1800:	842e                	mv	s0,a1
    1802:	00e59583          	lh	a1,14(a1)
    1806:	c606                	sw	ra,12(sp)
    1808:	2b89                	jal	1d5a <_read_r>
    180a:	00054963          	bltz	a0,181c <__sread+0x20>
    180e:	483c                	lw	a5,80(s0)
    1810:	97aa                	add	a5,a5,a0
    1812:	c83c                	sw	a5,80(s0)
    1814:	40b2                	lw	ra,12(sp)
    1816:	4422                	lw	s0,8(sp)
    1818:	0141                	addi	sp,sp,16
    181a:	8082                	ret
    181c:	00c45783          	lhu	a5,12(s0)
    1820:	777d                	lui	a4,0xfffff
    1822:	177d                	addi	a4,a4,-1
    1824:	8ff9                	and	a5,a5,a4
    1826:	00f41623          	sh	a5,12(s0)
    182a:	b7ed                	j	1814 <__sread+0x18>

0000182c <__seofread>:
    182c:	4501                	li	a0,0
    182e:	8082                	ret

00001830 <__swrite>:
    1830:	00c5d783          	lhu	a5,12(a1)
    1834:	1101                	addi	sp,sp,-32
    1836:	cc22                	sw	s0,24(sp)
    1838:	ca26                	sw	s1,20(sp)
    183a:	c84a                	sw	s2,16(sp)
    183c:	c64e                	sw	s3,12(sp)
    183e:	ce06                	sw	ra,28(sp)
    1840:	1007f793          	andi	a5,a5,256
    1844:	84aa                	mv	s1,a0
    1846:	842e                	mv	s0,a1
    1848:	8932                	mv	s2,a2
    184a:	89b6                	mv	s3,a3
    184c:	c791                	beqz	a5,1858 <__swrite+0x28>
    184e:	00e59583          	lh	a1,14(a1)
    1852:	4689                	li	a3,2
    1854:	4601                	li	a2,0
    1856:	2ec9                	jal	1c28 <_lseek_r>
    1858:	00c45783          	lhu	a5,12(s0)
    185c:	777d                	lui	a4,0xfffff
    185e:	177d                	addi	a4,a4,-1
    1860:	8ff9                	and	a5,a5,a4
    1862:	00f41623          	sh	a5,12(s0)
    1866:	00e41583          	lh	a1,14(s0)
    186a:	4462                	lw	s0,24(sp)
    186c:	40f2                	lw	ra,28(sp)
    186e:	86ce                	mv	a3,s3
    1870:	864a                	mv	a2,s2
    1872:	49b2                	lw	s3,12(sp)
    1874:	4942                	lw	s2,16(sp)
    1876:	8526                	mv	a0,s1
    1878:	44d2                	lw	s1,20(sp)
    187a:	6105                	addi	sp,sp,32
    187c:	a83d                	j	18ba <_write_r>

0000187e <__sseek>:
    187e:	1141                	addi	sp,sp,-16
    1880:	c422                	sw	s0,8(sp)
    1882:	842e                	mv	s0,a1
    1884:	00e59583          	lh	a1,14(a1)
    1888:	c606                	sw	ra,12(sp)
    188a:	2e79                	jal	1c28 <_lseek_r>
    188c:	57fd                	li	a5,-1
    188e:	00c45703          	lhu	a4,12(s0)
    1892:	00f51b63          	bne	a0,a5,18a8 <__sseek+0x2a>
    1896:	77fd                	lui	a5,0xfffff
    1898:	17fd                	addi	a5,a5,-1
    189a:	8ff9                	and	a5,a5,a4
    189c:	00f41623          	sh	a5,12(s0)
    18a0:	40b2                	lw	ra,12(sp)
    18a2:	4422                	lw	s0,8(sp)
    18a4:	0141                	addi	sp,sp,16
    18a6:	8082                	ret
    18a8:	6785                	lui	a5,0x1
    18aa:	8fd9                	or	a5,a5,a4
    18ac:	00f41623          	sh	a5,12(s0)
    18b0:	c828                	sw	a0,80(s0)
    18b2:	b7fd                	j	18a0 <__sseek+0x22>

000018b4 <__sclose>:
    18b4:	00e59583          	lh	a1,14(a1)
    18b8:	a229                	j	19c2 <_close_r>

000018ba <_write_r>:
    18ba:	1141                	addi	sp,sp,-16
    18bc:	c422                	sw	s0,8(sp)
    18be:	c226                	sw	s1,4(sp)
    18c0:	84aa                	mv	s1,a0
    18c2:	852e                	mv	a0,a1
    18c4:	85b2                	mv	a1,a2
    18c6:	8636                	mv	a2,a3
    18c8:	c606                	sw	ra,12(sp)
    18ca:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    18ce:	93ffe0ef          	jal	ra,20c <_write>
    18d2:	57fd                	li	a5,-1
    18d4:	00f51663          	bne	a0,a5,18e0 <_write_r+0x26>
    18d8:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    18dc:	c391                	beqz	a5,18e0 <_write_r+0x26>
    18de:	c09c                	sw	a5,0(s1)
    18e0:	40b2                	lw	ra,12(sp)
    18e2:	4422                	lw	s0,8(sp)
    18e4:	4492                	lw	s1,4(sp)
    18e6:	0141                	addi	sp,sp,16
    18e8:	8082                	ret

000018ea <__swsetup_r>:
    18ea:	1141                	addi	sp,sp,-16
    18ec:	c226                	sw	s1,4(sp)
    18ee:	84aa                	mv	s1,a0
    18f0:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
    18f4:	c422                	sw	s0,8(sp)
    18f6:	c606                	sw	ra,12(sp)
    18f8:	842e                	mv	s0,a1
    18fa:	c509                	beqz	a0,1904 <__swsetup_r+0x1a>
    18fc:	5d1c                	lw	a5,56(a0)
    18fe:	e399                	bnez	a5,1904 <__swsetup_r+0x1a>
    1900:	e7bfe0ef          	jal	ra,77a <__sinit>
    1904:	00c41703          	lh	a4,12(s0)
    1908:	01071793          	slli	a5,a4,0x10
    190c:	83c1                	srli	a5,a5,0x10
    190e:	0087f693          	andi	a3,a5,8
    1912:	eea9                	bnez	a3,196c <__swsetup_r+0x82>
    1914:	0107f693          	andi	a3,a5,16
    1918:	ee89                	bnez	a3,1932 <__swsetup_r+0x48>
    191a:	47a5                	li	a5,9
    191c:	c09c                	sw	a5,0(s1)
    191e:	04076713          	ori	a4,a4,64
    1922:	00e41623          	sh	a4,12(s0)
    1926:	557d                	li	a0,-1
    1928:	40b2                	lw	ra,12(sp)
    192a:	4422                	lw	s0,8(sp)
    192c:	4492                	lw	s1,4(sp)
    192e:	0141                	addi	sp,sp,16
    1930:	8082                	ret
    1932:	8b91                	andi	a5,a5,4
    1934:	c795                	beqz	a5,1960 <__swsetup_r+0x76>
    1936:	580c                	lw	a1,48(s0)
    1938:	c991                	beqz	a1,194c <__swsetup_r+0x62>
    193a:	04040793          	addi	a5,s0,64
    193e:	00f58563          	beq	a1,a5,1948 <__swsetup_r+0x5e>
    1942:	8526                	mv	a0,s1
    1944:	ff9fe0ef          	jal	ra,93c <_free_r>
    1948:	02042823          	sw	zero,48(s0)
    194c:	00c45783          	lhu	a5,12(s0)
    1950:	00042223          	sw	zero,4(s0)
    1954:	fdb7f793          	andi	a5,a5,-37
    1958:	00f41623          	sh	a5,12(s0)
    195c:	481c                	lw	a5,16(s0)
    195e:	c01c                	sw	a5,0(s0)
    1960:	00c45783          	lhu	a5,12(s0)
    1964:	0087e793          	ori	a5,a5,8
    1968:	00f41623          	sh	a5,12(s0)
    196c:	481c                	lw	a5,16(s0)
    196e:	ef81                	bnez	a5,1986 <__swsetup_r+0x9c>
    1970:	00c45783          	lhu	a5,12(s0)
    1974:	20000713          	li	a4,512
    1978:	2807f793          	andi	a5,a5,640
    197c:	00e78563          	beq	a5,a4,1986 <__swsetup_r+0x9c>
    1980:	85a2                	mv	a1,s0
    1982:	8526                	mv	a0,s1
    1984:	2e25                	jal	1cbc <__smakebuf_r>
    1986:	00c45783          	lhu	a5,12(s0)
    198a:	0017f713          	andi	a4,a5,1
    198e:	c705                	beqz	a4,19b6 <__swsetup_r+0xcc>
    1990:	485c                	lw	a5,20(s0)
    1992:	00042423          	sw	zero,8(s0)
    1996:	40f007b3          	neg	a5,a5
    199a:	cc1c                	sw	a5,24(s0)
    199c:	481c                	lw	a5,16(s0)
    199e:	4501                	li	a0,0
    19a0:	f7c1                	bnez	a5,1928 <__swsetup_r+0x3e>
    19a2:	00c41783          	lh	a5,12(s0)
    19a6:	0807f713          	andi	a4,a5,128
    19aa:	df3d                	beqz	a4,1928 <__swsetup_r+0x3e>
    19ac:	0407e793          	ori	a5,a5,64
    19b0:	00f41623          	sh	a5,12(s0)
    19b4:	bf8d                	j	1926 <__swsetup_r+0x3c>
    19b6:	8b89                	andi	a5,a5,2
    19b8:	4701                	li	a4,0
    19ba:	e391                	bnez	a5,19be <__swsetup_r+0xd4>
    19bc:	4858                	lw	a4,20(s0)
    19be:	c418                	sw	a4,8(s0)
    19c0:	bff1                	j	199c <__swsetup_r+0xb2>

000019c2 <_close_r>:
    19c2:	1141                	addi	sp,sp,-16
    19c4:	c422                	sw	s0,8(sp)
    19c6:	c226                	sw	s1,4(sp)
    19c8:	84aa                	mv	s1,a0
    19ca:	852e                	mv	a0,a1
    19cc:	c606                	sw	ra,12(sp)
    19ce:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    19d2:	f60fe0ef          	jal	ra,132 <_close>
    19d6:	57fd                	li	a5,-1
    19d8:	00f51663          	bne	a0,a5,19e4 <_close_r+0x22>
    19dc:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    19e0:	c391                	beqz	a5,19e4 <_close_r+0x22>
    19e2:	c09c                	sw	a5,0(s1)
    19e4:	40b2                	lw	ra,12(sp)
    19e6:	4422                	lw	s0,8(sp)
    19e8:	4492                	lw	s1,4(sp)
    19ea:	0141                	addi	sp,sp,16
    19ec:	8082                	ret

000019ee <_fclose_r>:
    19ee:	1141                	addi	sp,sp,-16
    19f0:	c606                	sw	ra,12(sp)
    19f2:	c422                	sw	s0,8(sp)
    19f4:	c226                	sw	s1,4(sp)
    19f6:	c04a                	sw	s2,0(sp)
    19f8:	e989                	bnez	a1,1a0a <_fclose_r+0x1c>
    19fa:	4901                	li	s2,0
    19fc:	40b2                	lw	ra,12(sp)
    19fe:	4422                	lw	s0,8(sp)
    1a00:	854a                	mv	a0,s2
    1a02:	4492                	lw	s1,4(sp)
    1a04:	4902                	lw	s2,0(sp)
    1a06:	0141                	addi	sp,sp,16
    1a08:	8082                	ret
    1a0a:	84aa                	mv	s1,a0
    1a0c:	842e                	mv	s0,a1
    1a0e:	c509                	beqz	a0,1a18 <_fclose_r+0x2a>
    1a10:	5d1c                	lw	a5,56(a0)
    1a12:	e399                	bnez	a5,1a18 <_fclose_r+0x2a>
    1a14:	d67fe0ef          	jal	ra,77a <__sinit>
    1a18:	00c41783          	lh	a5,12(s0)
    1a1c:	dff9                	beqz	a5,19fa <_fclose_r+0xc>
    1a1e:	85a2                	mv	a1,s0
    1a20:	8526                	mv	a0,s1
    1a22:	2085                	jal	1a82 <__sflush_r>
    1a24:	545c                	lw	a5,44(s0)
    1a26:	892a                	mv	s2,a0
    1a28:	c799                	beqz	a5,1a36 <_fclose_r+0x48>
    1a2a:	4c4c                	lw	a1,28(s0)
    1a2c:	8526                	mv	a0,s1
    1a2e:	9782                	jalr	a5
    1a30:	00055363          	bgez	a0,1a36 <_fclose_r+0x48>
    1a34:	597d                	li	s2,-1
    1a36:	00c45783          	lhu	a5,12(s0)
    1a3a:	0807f793          	andi	a5,a5,128
    1a3e:	c789                	beqz	a5,1a48 <_fclose_r+0x5a>
    1a40:	480c                	lw	a1,16(s0)
    1a42:	8526                	mv	a0,s1
    1a44:	ef9fe0ef          	jal	ra,93c <_free_r>
    1a48:	580c                	lw	a1,48(s0)
    1a4a:	c991                	beqz	a1,1a5e <_fclose_r+0x70>
    1a4c:	04040793          	addi	a5,s0,64
    1a50:	00f58563          	beq	a1,a5,1a5a <_fclose_r+0x6c>
    1a54:	8526                	mv	a0,s1
    1a56:	ee7fe0ef          	jal	ra,93c <_free_r>
    1a5a:	02042823          	sw	zero,48(s0)
    1a5e:	406c                	lw	a1,68(s0)
    1a60:	c591                	beqz	a1,1a6c <_fclose_r+0x7e>
    1a62:	8526                	mv	a0,s1
    1a64:	ed9fe0ef          	jal	ra,93c <_free_r>
    1a68:	04042223          	sw	zero,68(s0)
    1a6c:	df5fe0ef          	jal	ra,860 <__sfp_lock_acquire>
    1a70:	00041623          	sh	zero,12(s0)
    1a74:	deffe0ef          	jal	ra,862 <__sfp_lock_release>
    1a78:	b751                	j	19fc <_fclose_r+0xe>

00001a7a <fclose>:
    1a7a:	85aa                	mv	a1,a0
    1a7c:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
    1a80:	b7bd                	j	19ee <_fclose_r>

00001a82 <__sflush_r>:
    1a82:	00c59783          	lh	a5,12(a1)
    1a86:	1101                	addi	sp,sp,-32
    1a88:	cc22                	sw	s0,24(sp)
    1a8a:	01079713          	slli	a4,a5,0x10
    1a8e:	8341                	srli	a4,a4,0x10
    1a90:	ca26                	sw	s1,20(sp)
    1a92:	ce06                	sw	ra,28(sp)
    1a94:	c84a                	sw	s2,16(sp)
    1a96:	c64e                	sw	s3,12(sp)
    1a98:	00877693          	andi	a3,a4,8
    1a9c:	84aa                	mv	s1,a0
    1a9e:	842e                	mv	s0,a1
    1aa0:	eeed                	bnez	a3,1b9a <__sflush_r+0x118>
    1aa2:	6705                	lui	a4,0x1
    1aa4:	80070713          	addi	a4,a4,-2048 # 800 <__sfp+0x38>
    1aa8:	8fd9                	or	a5,a5,a4
    1aaa:	41d8                	lw	a4,4(a1)
    1aac:	00f59623          	sh	a5,12(a1)
    1ab0:	00e04d63          	bgtz	a4,1aca <__sflush_r+0x48>
    1ab4:	5dd8                	lw	a4,60(a1)
    1ab6:	00e04a63          	bgtz	a4,1aca <__sflush_r+0x48>
    1aba:	4501                	li	a0,0
    1abc:	40f2                	lw	ra,28(sp)
    1abe:	4462                	lw	s0,24(sp)
    1ac0:	44d2                	lw	s1,20(sp)
    1ac2:	4942                	lw	s2,16(sp)
    1ac4:	49b2                	lw	s3,12(sp)
    1ac6:	6105                	addi	sp,sp,32
    1ac8:	8082                	ret
    1aca:	5418                	lw	a4,40(s0)
    1acc:	d77d                	beqz	a4,1aba <__sflush_r+0x38>
    1ace:	0004a903          	lw	s2,0(s1)
    1ad2:	01379693          	slli	a3,a5,0x13
    1ad6:	0004a023          	sw	zero,0(s1)
    1ada:	0806d663          	bgez	a3,1b66 <__sflush_r+0xe4>
    1ade:	4830                	lw	a2,80(s0)
    1ae0:	00c45783          	lhu	a5,12(s0)
    1ae4:	8b91                	andi	a5,a5,4
    1ae6:	c799                	beqz	a5,1af4 <__sflush_r+0x72>
    1ae8:	405c                	lw	a5,4(s0)
    1aea:	8e1d                	sub	a2,a2,a5
    1aec:	581c                	lw	a5,48(s0)
    1aee:	c399                	beqz	a5,1af4 <__sflush_r+0x72>
    1af0:	5c5c                	lw	a5,60(s0)
    1af2:	8e1d                	sub	a2,a2,a5
    1af4:	541c                	lw	a5,40(s0)
    1af6:	4c4c                	lw	a1,28(s0)
    1af8:	4681                	li	a3,0
    1afa:	8526                	mv	a0,s1
    1afc:	9782                	jalr	a5
    1afe:	57fd                	li	a5,-1
    1b00:	00c45683          	lhu	a3,12(s0)
    1b04:	00f51d63          	bne	a0,a5,1b1e <__sflush_r+0x9c>
    1b08:	409c                	lw	a5,0(s1)
    1b0a:	4775                	li	a4,29
    1b0c:	08f76163          	bltu	a4,a5,1b8e <__sflush_r+0x10c>
    1b10:	20400737          	lui	a4,0x20400
    1b14:	0705                	addi	a4,a4,1
    1b16:	00f75733          	srl	a4,a4,a5
    1b1a:	8b05                	andi	a4,a4,1
    1b1c:	cb2d                	beqz	a4,1b8e <__sflush_r+0x10c>
    1b1e:	77fd                	lui	a5,0xfffff
    1b20:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_sp+0xffffc8af>
    1b24:	4818                	lw	a4,16(s0)
    1b26:	8ff5                	and	a5,a5,a3
    1b28:	07c2                	slli	a5,a5,0x10
    1b2a:	87c1                	srai	a5,a5,0x10
    1b2c:	c018                	sw	a4,0(s0)
    1b2e:	00f41623          	sh	a5,12(s0)
    1b32:	00042223          	sw	zero,4(s0)
    1b36:	01379713          	slli	a4,a5,0x13
    1b3a:	00075863          	bgez	a4,1b4a <__sflush_r+0xc8>
    1b3e:	57fd                	li	a5,-1
    1b40:	00f51463          	bne	a0,a5,1b48 <__sflush_r+0xc6>
    1b44:	409c                	lw	a5,0(s1)
    1b46:	e391                	bnez	a5,1b4a <__sflush_r+0xc8>
    1b48:	c828                	sw	a0,80(s0)
    1b4a:	580c                	lw	a1,48(s0)
    1b4c:	0124a023          	sw	s2,0(s1)
    1b50:	d5ad                	beqz	a1,1aba <__sflush_r+0x38>
    1b52:	04040793          	addi	a5,s0,64
    1b56:	00f58563          	beq	a1,a5,1b60 <__sflush_r+0xde>
    1b5a:	8526                	mv	a0,s1
    1b5c:	de1fe0ef          	jal	ra,93c <_free_r>
    1b60:	02042823          	sw	zero,48(s0)
    1b64:	bf99                	j	1aba <__sflush_r+0x38>
    1b66:	4c4c                	lw	a1,28(s0)
    1b68:	4601                	li	a2,0
    1b6a:	4685                	li	a3,1
    1b6c:	8526                	mv	a0,s1
    1b6e:	9702                	jalr	a4
    1b70:	57fd                	li	a5,-1
    1b72:	862a                	mv	a2,a0
    1b74:	f6f516e3          	bne	a0,a5,1ae0 <__sflush_r+0x5e>
    1b78:	409c                	lw	a5,0(s1)
    1b7a:	d3bd                	beqz	a5,1ae0 <__sflush_r+0x5e>
    1b7c:	4775                	li	a4,29
    1b7e:	00e78563          	beq	a5,a4,1b88 <__sflush_r+0x106>
    1b82:	4759                	li	a4,22
    1b84:	04e79463          	bne	a5,a4,1bcc <__sflush_r+0x14a>
    1b88:	0124a023          	sw	s2,0(s1)
    1b8c:	b73d                	j	1aba <__sflush_r+0x38>
    1b8e:	0406e793          	ori	a5,a3,64
    1b92:	00f41623          	sh	a5,12(s0)
    1b96:	557d                	li	a0,-1
    1b98:	b715                	j	1abc <__sflush_r+0x3a>
    1b9a:	0105a983          	lw	s3,16(a1)
    1b9e:	f0098ee3          	beqz	s3,1aba <__sflush_r+0x38>
    1ba2:	0005a903          	lw	s2,0(a1)
    1ba6:	8b0d                	andi	a4,a4,3
    1ba8:	0135a023          	sw	s3,0(a1)
    1bac:	41390933          	sub	s2,s2,s3
    1bb0:	4781                	li	a5,0
    1bb2:	e311                	bnez	a4,1bb6 <__sflush_r+0x134>
    1bb4:	49dc                	lw	a5,20(a1)
    1bb6:	c41c                	sw	a5,8(s0)
    1bb8:	f12051e3          	blez	s2,1aba <__sflush_r+0x38>
    1bbc:	505c                	lw	a5,36(s0)
    1bbe:	4c4c                	lw	a1,28(s0)
    1bc0:	86ca                	mv	a3,s2
    1bc2:	864e                	mv	a2,s3
    1bc4:	8526                	mv	a0,s1
    1bc6:	9782                	jalr	a5
    1bc8:	00a04763          	bgtz	a0,1bd6 <__sflush_r+0x154>
    1bcc:	00c45783          	lhu	a5,12(s0)
    1bd0:	0407e793          	ori	a5,a5,64
    1bd4:	bf7d                	j	1b92 <__sflush_r+0x110>
    1bd6:	99aa                	add	s3,s3,a0
    1bd8:	40a90933          	sub	s2,s2,a0
    1bdc:	bff1                	j	1bb8 <__sflush_r+0x136>

00001bde <_fflush_r>:
    1bde:	1101                	addi	sp,sp,-32
    1be0:	cc22                	sw	s0,24(sp)
    1be2:	ce06                	sw	ra,28(sp)
    1be4:	842a                	mv	s0,a0
    1be6:	c519                	beqz	a0,1bf4 <_fflush_r+0x16>
    1be8:	5d1c                	lw	a5,56(a0)
    1bea:	e789                	bnez	a5,1bf4 <_fflush_r+0x16>
    1bec:	c62e                	sw	a1,12(sp)
    1bee:	b8dfe0ef          	jal	ra,77a <__sinit>
    1bf2:	45b2                	lw	a1,12(sp)
    1bf4:	00c59783          	lh	a5,12(a1)
    1bf8:	c791                	beqz	a5,1c04 <_fflush_r+0x26>
    1bfa:	8522                	mv	a0,s0
    1bfc:	4462                	lw	s0,24(sp)
    1bfe:	40f2                	lw	ra,28(sp)
    1c00:	6105                	addi	sp,sp,32
    1c02:	b541                	j	1a82 <__sflush_r>
    1c04:	40f2                	lw	ra,28(sp)
    1c06:	4462                	lw	s0,24(sp)
    1c08:	4501                	li	a0,0
    1c0a:	6105                	addi	sp,sp,32
    1c0c:	8082                	ret

00001c0e <fflush>:
    1c0e:	85aa                	mv	a1,a0
    1c10:	e909                	bnez	a0,1c22 <fflush+0x14>
    1c12:	0301a503          	lw	a0,48(gp) # 2700 <_global_impure_ptr>
    1c16:	000025b7          	lui	a1,0x2
    1c1a:	bde58593          	addi	a1,a1,-1058 # 1bde <_fflush_r>
    1c1e:	9f6ff06f          	j	e14 <_fwalk_reent>
    1c22:	0381a503          	lw	a0,56(gp) # 2708 <_impure_ptr>
    1c26:	bf65                	j	1bde <_fflush_r>

00001c28 <_lseek_r>:
    1c28:	1141                	addi	sp,sp,-16
    1c2a:	c422                	sw	s0,8(sp)
    1c2c:	c226                	sw	s1,4(sp)
    1c2e:	84aa                	mv	s1,a0
    1c30:	852e                	mv	a0,a1
    1c32:	85b2                	mv	a1,a2
    1c34:	8636                	mv	a2,a3
    1c36:	c606                	sw	ra,12(sp)
    1c38:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    1c3c:	d7cfe0ef          	jal	ra,1b8 <_lseek>
    1c40:	57fd                	li	a5,-1
    1c42:	00f51663          	bne	a0,a5,1c4e <_lseek_r+0x26>
    1c46:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    1c4a:	c391                	beqz	a5,1c4e <_lseek_r+0x26>
    1c4c:	c09c                	sw	a5,0(s1)
    1c4e:	40b2                	lw	ra,12(sp)
    1c50:	4422                	lw	s0,8(sp)
    1c52:	4492                	lw	s1,4(sp)
    1c54:	0141                	addi	sp,sp,16
    1c56:	8082                	ret

00001c58 <__swhatbuf_r>:
    1c58:	7119                	addi	sp,sp,-128
    1c5a:	daa6                	sw	s1,116(sp)
    1c5c:	84ae                	mv	s1,a1
    1c5e:	00e59583          	lh	a1,14(a1)
    1c62:	dca2                	sw	s0,120(sp)
    1c64:	de86                	sw	ra,124(sp)
    1c66:	8432                	mv	s0,a2
    1c68:	0005dc63          	bgez	a1,1c80 <__swhatbuf_r+0x28>
    1c6c:	00c4d783          	lhu	a5,12(s1)
    1c70:	0006a023          	sw	zero,0(a3)
    1c74:	0807f793          	andi	a5,a5,128
    1c78:	eb8d                	bnez	a5,1caa <__swhatbuf_r+0x52>
    1c7a:	40000793          	li	a5,1024
    1c7e:	a805                	j	1cae <__swhatbuf_r+0x56>
    1c80:	0830                	addi	a2,sp,24
    1c82:	c636                	sw	a3,12(sp)
    1c84:	2219                	jal	1d8a <_fstat_r>
    1c86:	46b2                	lw	a3,12(sp)
    1c88:	fe0542e3          	bltz	a0,1c6c <__swhatbuf_r+0x14>
    1c8c:	4772                	lw	a4,28(sp)
    1c8e:	67bd                	lui	a5,0xf
    1c90:	6505                	lui	a0,0x1
    1c92:	8ff9                	and	a5,a5,a4
    1c94:	7779                	lui	a4,0xffffe
    1c96:	97ba                	add	a5,a5,a4
    1c98:	0017b793          	seqz	a5,a5
    1c9c:	c29c                	sw	a5,0(a3)
    1c9e:	40000793          	li	a5,1024
    1ca2:	c01c                	sw	a5,0(s0)
    1ca4:	80050513          	addi	a0,a0,-2048 # 800 <__sfp+0x38>
    1ca8:	a029                	j	1cb2 <__swhatbuf_r+0x5a>
    1caa:	04000793          	li	a5,64
    1cae:	c01c                	sw	a5,0(s0)
    1cb0:	4501                	li	a0,0
    1cb2:	50f6                	lw	ra,124(sp)
    1cb4:	5466                	lw	s0,120(sp)
    1cb6:	54d6                	lw	s1,116(sp)
    1cb8:	6109                	addi	sp,sp,128
    1cba:	8082                	ret

00001cbc <__smakebuf_r>:
    1cbc:	00c5d783          	lhu	a5,12(a1)
    1cc0:	1101                	addi	sp,sp,-32
    1cc2:	cc22                	sw	s0,24(sp)
    1cc4:	ce06                	sw	ra,28(sp)
    1cc6:	ca26                	sw	s1,20(sp)
    1cc8:	c84a                	sw	s2,16(sp)
    1cca:	8b89                	andi	a5,a5,2
    1ccc:	842e                	mv	s0,a1
    1cce:	cf89                	beqz	a5,1ce8 <__smakebuf_r+0x2c>
    1cd0:	04340793          	addi	a5,s0,67
    1cd4:	c01c                	sw	a5,0(s0)
    1cd6:	c81c                	sw	a5,16(s0)
    1cd8:	4785                	li	a5,1
    1cda:	c85c                	sw	a5,20(s0)
    1cdc:	40f2                	lw	ra,28(sp)
    1cde:	4462                	lw	s0,24(sp)
    1ce0:	44d2                	lw	s1,20(sp)
    1ce2:	4942                	lw	s2,16(sp)
    1ce4:	6105                	addi	sp,sp,32
    1ce6:	8082                	ret
    1ce8:	0074                	addi	a3,sp,12
    1cea:	0030                	addi	a2,sp,8
    1cec:	84aa                	mv	s1,a0
    1cee:	37ad                	jal	1c58 <__swhatbuf_r>
    1cf0:	45a2                	lw	a1,8(sp)
    1cf2:	892a                	mv	s2,a0
    1cf4:	8526                	mv	a0,s1
    1cf6:	98aff0ef          	jal	ra,e80 <_malloc_r>
    1cfa:	ed01                	bnez	a0,1d12 <__smakebuf_r+0x56>
    1cfc:	00c41783          	lh	a5,12(s0)
    1d00:	2007f713          	andi	a4,a5,512
    1d04:	ff61                	bnez	a4,1cdc <__smakebuf_r+0x20>
    1d06:	9bf1                	andi	a5,a5,-4
    1d08:	0027e793          	ori	a5,a5,2
    1d0c:	00f41623          	sh	a5,12(s0)
    1d10:	b7c1                	j	1cd0 <__smakebuf_r+0x14>
    1d12:	000007b7          	lui	a5,0x0
    1d16:	72078793          	addi	a5,a5,1824 # 720 <_cleanup_r>
    1d1a:	dcdc                	sw	a5,60(s1)
    1d1c:	00c45783          	lhu	a5,12(s0)
    1d20:	c008                	sw	a0,0(s0)
    1d22:	c808                	sw	a0,16(s0)
    1d24:	0807e793          	ori	a5,a5,128
    1d28:	00f41623          	sh	a5,12(s0)
    1d2c:	47a2                	lw	a5,8(sp)
    1d2e:	c85c                	sw	a5,20(s0)
    1d30:	47b2                	lw	a5,12(sp)
    1d32:	cf89                	beqz	a5,1d4c <__smakebuf_r+0x90>
    1d34:	00e41583          	lh	a1,14(s0)
    1d38:	8526                	mv	a0,s1
    1d3a:	28bd                	jal	1db8 <_isatty_r>
    1d3c:	c901                	beqz	a0,1d4c <__smakebuf_r+0x90>
    1d3e:	00c45783          	lhu	a5,12(s0)
    1d42:	9bf1                	andi	a5,a5,-4
    1d44:	0017e793          	ori	a5,a5,1
    1d48:	00f41623          	sh	a5,12(s0)
    1d4c:	00c45783          	lhu	a5,12(s0)
    1d50:	00f96933          	or	s2,s2,a5
    1d54:	01241623          	sh	s2,12(s0)
    1d58:	b751                	j	1cdc <__smakebuf_r+0x20>

00001d5a <_read_r>:
    1d5a:	1141                	addi	sp,sp,-16
    1d5c:	c422                	sw	s0,8(sp)
    1d5e:	c226                	sw	s1,4(sp)
    1d60:	84aa                	mv	s1,a0
    1d62:	852e                	mv	a0,a1
    1d64:	85b2                	mv	a1,a2
    1d66:	8636                	mv	a2,a3
    1d68:	c606                	sw	ra,12(sp)
    1d6a:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    1d6e:	c6afe0ef          	jal	ra,1d8 <_read>
    1d72:	57fd                	li	a5,-1
    1d74:	00f51663          	bne	a0,a5,1d80 <_read_r+0x26>
    1d78:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    1d7c:	c391                	beqz	a5,1d80 <_read_r+0x26>
    1d7e:	c09c                	sw	a5,0(s1)
    1d80:	40b2                	lw	ra,12(sp)
    1d82:	4422                	lw	s0,8(sp)
    1d84:	4492                	lw	s1,4(sp)
    1d86:	0141                	addi	sp,sp,16
    1d88:	8082                	ret

00001d8a <_fstat_r>:
    1d8a:	1141                	addi	sp,sp,-16
    1d8c:	c422                	sw	s0,8(sp)
    1d8e:	c226                	sw	s1,4(sp)
    1d90:	84aa                	mv	s1,a0
    1d92:	852e                	mv	a0,a1
    1d94:	85b2                	mv	a1,a2
    1d96:	c606                	sw	ra,12(sp)
    1d98:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    1d9c:	bc4fe0ef          	jal	ra,160 <_fstat>
    1da0:	57fd                	li	a5,-1
    1da2:	00f51663          	bne	a0,a5,1dae <_fstat_r+0x24>
    1da6:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    1daa:	c391                	beqz	a5,1dae <_fstat_r+0x24>
    1dac:	c09c                	sw	a5,0(s1)
    1dae:	40b2                	lw	ra,12(sp)
    1db0:	4422                	lw	s0,8(sp)
    1db2:	4492                	lw	s1,4(sp)
    1db4:	0141                	addi	sp,sp,16
    1db6:	8082                	ret

00001db8 <_isatty_r>:
    1db8:	1141                	addi	sp,sp,-16
    1dba:	c422                	sw	s0,8(sp)
    1dbc:	c226                	sw	s1,4(sp)
    1dbe:	84aa                	mv	s1,a0
    1dc0:	852e                	mv	a0,a1
    1dc2:	c606                	sw	ra,12(sp)
    1dc4:	0601ac23          	sw	zero,120(gp) # 2748 <errno>
    1dc8:	bd4fe0ef          	jal	ra,19c <_isatty>
    1dcc:	57fd                	li	a5,-1
    1dce:	00f51663          	bne	a0,a5,1dda <_isatty_r+0x22>
    1dd2:	0781a783          	lw	a5,120(gp) # 2748 <errno>
    1dd6:	c391                	beqz	a5,1dda <_isatty_r+0x22>
    1dd8:	c09c                	sw	a5,0(s1)
    1dda:	40b2                	lw	ra,12(sp)
    1ddc:	4422                	lw	s0,8(sp)
    1dde:	4492                	lw	s1,4(sp)
    1de0:	0141                	addi	sp,sp,16
    1de2:	8082                	ret
